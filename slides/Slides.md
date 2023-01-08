---
marp: true
theme: default
footer: '@Chris_L_Ayers - https://chris-ayers.com'
style: |
  .columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
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
- ### VSCode Integration
- ### GitHub Actions

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

