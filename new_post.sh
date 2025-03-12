
#!/bin/bash

# Usage: ./new_post.sh "Post Title" "Category1,Category2" "Tag1,Tag2,Tag3"

if [ $# -lt 1 ]; then
    echo "Usage: $0 \"Post Title\" [Categories (comma-separated)] [Tags (comma-separated)]"
    exit 1
fi

TITLE="$1"
CATEGORIES=${2:-"Blog"}
TAGS=${3:-"Development"}

# Slugify the title: convert to lowercase, replace non-alphanumerics with dashes
slug=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')

# Get current date in yyyy-mm-dd format
DATE=$(date +%Y-%m-%d)
FILENAME="${DATE}-${slug}.md"

# Ensure _posts directory exists
mkdir -p _posts

# Get current date/time in ISO 8601 format (GNU date preferred)
MODIFIED=$(date --iso-8601=seconds 2>/dev/null)
if [ -z "$MODIFIED" ]; then
    # Fallback for macOS
    MODIFIED=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
fi

# Convert comma-separated values to arrays
IFS=',' read -r -a CAT_ARRAY <<< "$CATEGORIES"
IFS=',' read -r -a TAG_ARRAY <<< "$TAGS"

# Build YAML front matter and default content
{
  echo "---"
  echo "title: \"$TITLE\""
  echo "last_modified_at: $MODIFIED"
  echo "categories:"
  for cat in "${CAT_ARRAY[@]}"; do
    cat=$(echo "$cat" | sed 's/^ *//;s/ *$//')
    echo "  - $cat"
  done
  echo "tags:"
  for tag in "${TAG_ARRAY[@]}"; do
    tag=$(echo "$tag" | sed 's/^ *//;s/ *$//')
    echo "  - $tag"
  done
  echo "---"
  echo ""
  echo "This post has been updated and should show a modified date if used in a layout."
} > "_posts/${FILENAME}"

echo "New post created: _posts/${FILENAME}"
