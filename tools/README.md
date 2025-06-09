## Project Overview: "Ask My Blog"

This project's goal is build a Retrieval-Augmented Generation (RAG) assistant for my Markdown-based blog posts (Jekyll format). It allows for natural language search and Q&A over the content, powered by embeddings, a vector database, and a language model.

Each Jupyter Notebook in this project corresponds to a specific stage in the pipeline and includes detailed descriptions, code, and experiments.

---

## Top-Level Tasks

1. **Ingestion**  
   Read all blog posts (Markdown `.md` files), extract metadata (title, tags, etc.), and split the content into meaningful "chunks" (typically by heading).  
   → Output:

   - `chunks_raw.jsonl`: output of extract + format
   - `chunks_trimmed_<length>.jsonl`: cleaned to <length> tokens max
   - `chunks_overlap_300_100.jsonl`: windowed with <length>-token overlap

2. **Embedding + Indexing**  
   Convert each chunk of text into a vector using an embedding model (e.g., MiniLM). Store these vectors in a local vector database (e.g., Chroma) or a flat file for simplicity
   → Output: Populated vector store.

3. **RAG Search**  
   Accept a user question, convert it to a vector, search for the most relevant chunks, and pass them to a language model to generate a response.  
   → Output: Natural-language answer with references

4. **FAQ Generation**  
   Automatically generate Frequently Asked Questions for each blog post based on its content, using chunk-level LLM prompts.  
   → Output: `faqs.jsonl`

---

## 🛠️ Development Notes

- All data processing happens **locally**, using local models and storage.
- **JSONL** is used for intermediate storage (e.g., content chunks, FAQs) to keep things simple and transparent.
- All stages are implemented in **Jupyter notebooks** for exploratory development, visibility, and reproducibility.
- I'm **not building a polished UI** — a basic CLI search tool is more than enough for this project.
- Given the scale and simplicity, I expect the results to be **"iffy" at best** — and that's fine. The goal is to learn and build something useful end-to-end.

## Set up

From the root of the project

```
python3 -m venv .venv
```

To activate it

```
source .venv/bin/activate
```

To deactivate

```
deactivate
```
