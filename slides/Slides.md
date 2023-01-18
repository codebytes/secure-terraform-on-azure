---
marp: true
theme: default
footer: 'https://chris-ayers.com'
style: |
  .columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
  .columns3 {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 1rem;
  } 
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
  
  @import 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css'
---

![bg right:60% contain](./img/secure-terraform.png)

# Secure Terraform on Azure

---

![bg left:40%](./img/portrait.jpg)

## Chris Ayers
### Senior Customer Engineer<br>Microsoft

<i class="fa-brands fa-twitter"></i> Twitter: @Chris\_L\_Ayers
<i class="fa-brands fa-mastodon"></i> Mastodon: @Chrisayers@hachyderm.io
<i class="fa-brands fa-linkedin"></i> LinkedIn: - [chris\-l\-ayers](https://linkedin.com/in/chris-l-ayers/)
<i class="fa fa-window-maximize"></i> Blog: [https://chris-ayers\.com/](https://chris-ayers.com/)
<i class="fa-brands fa-github"></i> GitHub: [Codebytes](https://github.com/codebytes)

---

<div class="columns">
<div>

# Agenda

</div>
<div>

- ### What is IaC?
- ### Security Tooling
  - #### Rules & Customization
  - #### Workflow
- ### Integration
  - #### Precommit hook
  - #### VSCode Integration
  - #### GitHub Actions

</div>
</div>

---

# What is IaC?

<div class="columns">
<div>
Infrastructure as code (IaC) is a way to manage and provision infrastructure resources using configuration files and automation tools. 
</div>

<div>
The goal of IaC is to make it easier to deploy and manage infrastructure in a repeatable, reliable way, and to reduce the risk of errors caused by manual configuration.
</div>
</div>

---

# Security Tooling

Running static analysis security testing (SAST) tools against infrastructure as code (IaC) is a way to ensure that the infrastructure being provisioned is secure and compliant with best practices. 

---

# Why run Security Tooling?

## <i class="fa-solid fa-lock"></i> To catch security issues early
## <i class="fa-regular fa-square-check"></i> To ensure compliance
## <i class="fa-solid fa-chart-line"></i> To improve the security of your infrastructure
## <i class="fa-regular fa-clock"></i> To save time and effort by shifting Left

---

# Security and Compliance

There have been multiple breaches and attacks due to misconfiguration.
Vulnerabilities can be a simple omitted property.

---

# OWASP Top 10

<div class="columns">
<div>
<br />

[A05:2021 – Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)


![50% center](./img/owasp.png)

</div>
<div>

![50% center](./img/k8s-topten.png)

</div>
</div>

---

# Shift Left on Security
## Save time and money

We can't just do security in production after everything is built, we need to go into solutions with security baked in.

---

# Security Tooling - Terraform

Each of these tools does similar things and are SAST (Static Analysis Security Tooling).
With Terraform you can analyze in a few ways.

1) HCL files
1) Terraform Plan

---

# Rule customization

- Ignoring rules
- Overriding rules
- Add custom rules

---

# Security Tooling - OSS

<div class="columns">
<div>
  <br />
There are many open-source tools as well as commercial solutions. We can integrate these tools in our local environments as well as our pipelines to secure things earlier.
</div>
<div>

| Feature | tfsec | terrascan | checkov |
| --- | --- | --- | --- |
| CI/CD  | Yes | Yes | Yes |
| Rules | 100+ | 100+ | 100+ |
| Custom Rules | Yes | Yes | Yes |
| Whitelist Rules | Yes | Yes | Yes |
| Ignore Rules | Yes | Yes | Yes |

</div>
</div>

---

# tfsec

tfsec is a static analysis security scanner for your Terraform code supported by Aquasecurity.

Designed to run locally and in your CI pipelines, developer-friendly output and fully documented checks.

- OPA/Rego Policies
- VS Code Extension
- GitHub Actions

![bg right 90%](./img/tfsec-demo.gif)

---

# Terrascan

Terrascan has support for Terraform, Azure, GCP, AWS, Kubernetes  (manifests, Helm, Kustomize), Docker and even GitHub. Supported by Tenable and now integrated into nessus.

Terrascan has a large number of built in policies as well as support for custom OPA/Rego Policies.

![bg right 90%](./img/terrascan.png)

---

# Checkov

Checkov is another tool that lets us do scanning and compliance. 

Checkov is by BridgeCrew and python based. Checkov, like terrascan, supports Terraform, Azure, GCP, AWS, Kubernetes  (manifests, Helm, Kustomize) and Docker.

![bg right 90%](./img/checkov.png)

---

# Bonus Tool - Terraform Compliance

https://terraform-compliance.com/

BDD and Cucumber testing!

![bg right drop-shadow 90%](./img/terraform-compliance.png)

---

# Using Multiple Tools

## Defense in Depth

Because these tools are independent and all scan the raw HCL or interpreted HCL, you can get different rules and potentially better compliance.

You can also hit a Signal to Noise problem.

---

# Workflow Options

- pre-commit hooks
- ide integration
- ci/cd integration
- DAST (environment scanning)

---

# Pre-Commit Hooks

Pre-commit Hooks run before code gets committed to a git repo.
You do it yourself or use the precommit framework.

<br />

![center](./img/githooks.png)


---

# IDE Integration

- Extensions for VSCode
  - [tfsec](https://marketplace.visualstudio.com/items?itemName=tfsec.tfsec)
  - [checkov](https://marketplace.visualstudio.com/items?itemName=Bridgecrew.checkov)
- DevContainer features
  - [tfsec](https://github.com/dhoeric/features/tree/main/src/tfsec)
  - [terrascan](https://github.com/devcontainers-contrib/features/tree/main/src/terrascan)
  - [checkov](http://github.com/devcontainers-contrib/features/tree/main/src/checkov)


---

# Pipeline integration

- GitHub Marketplace Extensions
  - [tfsec action](https://github.com/marketplace/actions/tfsec-action)
  - [Run tfsec PR commenter](https://github.com/marketplace/actions/run-tfsec-pr-commenter)
  - [Terrascan IaC scanner](https://github.com/marketplace/actions/terrascan-iac-scanner)
  - [Checkov GitHub Action](https://github.com/marketplace/actions/checkov-github-action)

---

# DEMOS

---

# Backend providers

- AzureRM
- Docs for other providers

---

# Overriding backend provider configuration

- Check docs
- Use environment vars 

<!-- show vars or link -->
---

# Open ID Connect (OIDC) Auth

No more passwords
Auth based on repo, environment, branch

---

# Demos

Putting it all together

Using https://github.com/tenable/KaiMonkey

---

# Questions
![bg right](./img/owl.png)

---

<div class="columns">
<div>

## Resources

#### GitHub Repo
#### https://github.com/codebytes/secure-terraform-on-azure

#### Blog
#### https://chris-ayers.com

</div>

<div>

## Contact

<i class="fa-brands fa-twitter"></i> Twitter: @Chris\_L\_Ayers
<i class="fa-brands fa-mastodon"></i> Mastodon: @Chrisayers@hachyderm.io
<i class="fa-brands fa-linkedin"></i> LinkedIn: - [chris\-l\-ayers](https://linkedin.com/in/chris-l-ayers/)
<i class="fa fa-window-maximize"></i> Blog: [https://chris-ayers\.com/](https://chris-ayers.com/)
<i class="fa-brands fa-github"></i> GitHub: [Codebytes](https://github.com/codebytes)

</div>
</div>
