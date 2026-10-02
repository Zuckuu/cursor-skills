# Shared OOXML tooling

Single copy of the Office Open XML validation/schema tree used by the `docx`, `pptx`, and `xlsx` skills.

When copying those document skills into another repo, copy **this folder** too and keep symlinks:

- `docx/scripts/office` → `../../shared-ooxml/office`
- `pptx/scripts/office` → `../../shared-ooxml/office`
- `xlsx/scripts/office` → `../../shared-ooxml/office`

Or replace symlinks with a copy of `shared-ooxml/office` inside each skill if your environment does not support symlinks.
