---
marp: true
theme: default
footer: 'https://hachyderm.io/@Chrisayers - @Chris_L_Ayers - https://chris-ayers.com'
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
  @import 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css'
---

![bg right:60% contain](./img/secure-terraform.png)

# Secure Terraform on Azure

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

# OWASP

[A05:2021 – Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)

![contain](./img/owasp.png)


---

# Shift Left on Security
## Save time and money

We can't just do security in production after everything is built, we need to go into solutions with security baked in.

---

# Security Tooling - Terraform

Each of these tools does similar things and are SAST (Static Analysis Security Tooling).
With Terraform you can analyze in a few ways.

1) hcl files
1) hcl files after interpolation and parsing

---

# Rule customization

- ignoring rules
- overriding rules
- adding custom rules

---

# Security Tooling - OSS

<div class="columns">
<div>
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

---

# Terrascan

---

# checkov

---

# Workflow Options

- pre-commit hooks
- ide integration
- ci/cd integration
- DAST (environment scanning)

---

# Pre-Commit Hooks

run before code gets committed to a git repo.
You do it yourself or use the precommit framework.

---

# IDE Integration

- extensions for vscode

---

# Pipeline integration

lots of marketplace extensions
pr commenter

---

# Backend providers

- AzureRM
- docs

---

# Overriding backend provider configuration
- Check docs
- use environment vars 

<!-- show vars or link -->
---

# Open ID Connect (OIDC) Auth

No more passwords
Auth based on repo, environment, branch

---

# Demos

Putting it all together

---

# Questions

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
<i class="fa fa-twitter"></i> [@Chris_L_Ayers](https://twitter.com/Chris_L_Ayers)
<i class="fa fa-mastodon"></i> https://hachyderm.io/@Chrisayers
<i class="fa fa-linkedin"></i> [chris-l-ayers](https://www.linkedin.com/in/chris-l-ayers/)

</div>
</div>
