# Terraform Random Password Manager

A Terraform module that generates and manages two passwords (**active** and **backup**)
with safe rotation and swapping behavior.

---

##  Features
- 🔐 Generate two passwords on initial creation
- 🔁 Rotate **only** the backup password (on demand)
- 🔄 Swap **active ↔ backup** safely
- 🧱 Idempotent and substrate-agnostic (no cloud dependencies)
- ⚙️ Prevents rotation and swapping in the same run

---

## 🧩 Usage

```hcl
module "password_manager" {
  source = "./modules/terraform-random-password-manager"

  password_length = 24
  rotate_backup   = false
  swap_passwords  = false
}
```

### 🔁 Rotate Backup Password
```bash
terraform apply -var="rotate_backup=true"
```

### 🔄 Swap Active and Backup Passwords
```bash
terraform apply -var="swap_passwords=true"
```

> ⚠️ **Note:** You cannot rotate and swap passwords in the same apply operation.

---

## 📤 Outputs
| Output | Description | Sensitive |
|--------|--------------|------------|
| `active_password` | The currently active password | ✅ |
| `backup_password` | The backup password | ✅ |

---

## 🧪 Test Scenarios

| Scenario | rotate_backup | swap_passwords | Expected Behavior |
|-----------|----------------|----------------|-------------------|
| Initial run | false | false | Generates both passwords |
| Rotate backup only | true | false | Regenerates only backup password |
| Swap passwords | false | true | Swaps active ↔ backup |
| Invalid operation | true | true | Fails with safety error |

---

##  Requirements
- Terraform ≥ **1.3.0**
- Provider: `hashicorp/random` ≥ **3.6.0**

---

##  Author
**Raghavarao Jonnalagadda**
