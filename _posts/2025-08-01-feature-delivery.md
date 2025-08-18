---
title: "Delivering Features"
last_modified_at: 2025-08-01T14:35:24Z
categories:
  - DevOps
---

# Feature Delivery in Flow State

## Core Principle
Features are released in small, reversible steps behind feature flags. Always ask: "Can we roll this back?"

Never ship completed features as one big deployment. Break everything into incremental steps that can be independently rolled back.

## Laravel Example: Adding `due_date` Column

Let's add a due date field to tasks, step by step:

### Step 1: Database (Non-destructive)
```php
// Migration - always additive
Schema::table('tasks', function (Blueprint $table) {
    $table->timestamp('due_date')->nullable();
});
```
**Deploy immediately** - adding nullable columns is safe.

### Step 2: Update Models (Write-only)
```php
class Task extends Model
{
    protected $fillable = ['title', 'description', 'due_date'];
    
    // Don't add due_date to accessors/relationships yet
    // Just allow writing, no reading
}
```
**Why this order**: Models can write to new column without breaking existing code.

### Step 3: Start Writing (Feature Flag)
```php
class TaskController extends Controller 
{
    public function store(Request $request)
    {
        $data = $request->validated();
        
        if (Feature::active('task_due_dates')) {
            $data['due_date'] = $request->input('due_date');
        }
        
        return Task::create($data);
    }
}
```

### Step 4: Backfill Existing Data (If Needed)
```php
// Artisan command - run when ready
Task::whereNull('due_date')
    ->update(['due_date' => now()->addWeek()]);
```

### Step 5: Start Reading (Feature Flag)
```php
class TaskResource extends JsonResource
{
    public function toArray($request)
    {
        $data = [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
        ];
        
        if (Feature::active('task_due_dates')) {
            $data['due_date'] = $this->due_date;
        }
        
        return $data;
    }
}
```

### Step 6: Add Validation (Feature Flag)
```php
class StoreTaskRequest extends FormRequest
{
    public function rules()
    {
        $rules = [
            'title' => 'required|string',
            'description' => 'required|string',
        ];
        
        if (Feature::active('task_due_dates')) {
            $rules['due_date'] = 'required|date|after:now';
        }
        
        return $rules;
    }
}
```

### Step 7: Gradual Rollout
- Enable for internal users first
- Monitor error rates and performance  
- Gradually increase percentage: 5% → 25% → 50% → 100%
- Roll back instantly if issues appear

### Step 8: Cleanup
```php
// Remove feature flags once stable
class TaskResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title, 
            'description' => $this->description,
            'due_date' => $this->due_date, // No flag needed
        ];
    }
}
```

## Key Patterns

**Non-destructive changes first**: Add columns, don't modify or remove them.

**Write before read**: Populate new data before consuming it.

**Feature flags everywhere**: Every user-facing change should be toggleable(?).

**Monitor each step**: Watch error rates, performance, user behavior.

**Small batches**: Each deployment should change one thing.

## Rollback Strategy

Each step can be independently rolled back:
- Database: Nullable columns can be ignored
- Models: Remove from fillable array
- Controllers: Toggle feature flag off
- Resources: Feature flag hides new fields
- Validation: Feature flag disables new rules

## Success Metrics
- Deploy daily (or more)
- Rollback in under 5 minutes
- Less than 2% of deployments require rollback
- No "big bang" releases
