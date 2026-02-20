# invariance-hash

`invariance-hash` computes a deterministic SHA-256 hash over a set of files and directories.

It is intended for build-invariance validation, where a change in input files must reliably change the resulting hash.

---

## Usage

```
invariance-hash PATH...
```

Each argument may be:

* A regular file
* A directory (processed recursively)

---

## Semantics

* Files are hashed directly.
* Directories are traversed recursively.
* File ordering is byte-wise deterministic (`LC_ALL=C`).
* The final output is a single SHA-256 digest.

If any input path does not exist, the program exits with an error.

---

## Purpose

The tool is designed for reproducible build systems and container
invariance validation, where input drift must be detected precisely and deterministically.
