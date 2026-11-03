# Agent instructions: Securely Deploying Infrastructure As Code

This repository holds the slides and demos for Chris Ayers' talk **Securely Deploying Infrastructure as Code**. The deck is published to <https://chris-ayers.com/secure-terraform-on-azure/>.

## Repository layout

- `slides/`: Marp deck, images in `slides/img/`, themes in `slides/themes/`.
- `example/dev/`, `example/prod/`, `example/modules/`: the Terraform deployment the CI workflow plans and applies.
- `demos/sample1-sa`, `demos/sample2-kv`, `demos/sample3-as`: small Terraform samples the scanners run against on stage; `demos/KaiMonkey` is a Git submodule of Tenable's vulnerable-by-design Terraform.
- `.tfsec/`, `tfsec_rego_policies/`, `terrascan_rego_policies/`, `custom_checks_examples/`: custom policies for tfsec, Terrascan, and Checkov.

## Slides

- Write the deck in Markdown with [Marp](https://marp.app/). `slides/Slides.md` is the source; `build/` is generated output and is never edited or committed.
- Keep the frontmatter at the top of the deck:

  ```yaml
  ---
  marp: true
  theme: custom-default
  ---
  ```

- Store themes in `slides/themes/` and images and diagram sources in `slides/img/`. Prefer theme classes and CSS variables over inline styles.
- Write speaker notes as HTML comments (`<!-- -->`).
- Render locally with the Marp CLI version the Pages workflow uses (v3.0.2):

  ```bash
  npx @marp-team/marp-cli@3.0.2 --theme-set slides/themes --html -o build/index.html -- slides/Slides.md
  npx @marp-team/marp-cli@3.0.2 --theme-set slides/themes --html --pdf --allow-local-files -o build/Slides.pdf -- slides/Slides.md
  ```

- `.github/workflows/marp.yml` builds the HTML deck and `Slides.pdf` and publishes both to GitHub Pages. If you add slide assets outside `slides/img/` and `slides/themes/`, add them to the workflow's copy step.

## Shared skills

Use the shared skills from [codebytes/skills](https://github.com/codebytes/skills) (for Copilot CLI: `copilot plugin install https://github.com/codebytes/skills`). Don't copy their instructions or scripts into this repository.

| Task                                                                          | Skill               |
| ----------------------------------------------------------------------------- | ------------------- |
| Write or revise slides, notes, order, or layouts                              | `marp-authoring`    |
| Charts, Mermaid diagrams, or other visuals                                    | `marp-visuals`      |
| Editable `.drawio.svg` diagrams (stored in `slides/img/`)                     | `drawio-diagrams`   |
| Check overflow, clipping, and HTML/PDF parity before presenting or publishing | `marp-slide-review` |

## Build and run

```bash
git submodule update --init   # fetch demos/KaiMonkey
terraform -chdir=example/dev init -backend=false && terraform fmt -check -recursive
tfsec . ; checkov -d . ; terrascan scan
```

## Talk-specific rules

- Scanner findings in `demos/` may be what the talk demonstrates; check the slides before fixing them.
- The Terraform workflow logs in to Azure with OIDC secrets from the repository settings; never add credentials to `.tf` files or workflows.
- The Pages workflow is `.github/workflows/marp.yml` (not `marp-pages.yml`).

## Readme

- Keep the readme sections in this order: Slides, Recordings, Resources, Contact.
- When a new recording of the talk is published, add it at the top of `## Recordings` as `- [Event Year](https://www.youtube.com/watch?v=VIDEO_ID)`. When the video's title differs from the talk's, add an em dash and the recorded title after the event. Keep the list newest first.
- The talk also appears on <https://chris-ayers.com/speaking/> (source: `content/speaking.md` in [codebytes/codebytes.github.io](https://github.com/codebytes/codebytes.github.io)); new events and recordings belong there too.

## General

- Keep changes scoped to the request; don't reformat unrelated slides or code.
- Never commit secrets, keys, or connection strings. Demo placeholders must be obviously fake.
