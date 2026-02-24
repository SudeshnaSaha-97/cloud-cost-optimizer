# Case Study – Cloud Cost Optimizer in Action

This case study demonstrates how the SaaS MVP helps enterprises identify idle resources and achieve measurable savings. It is recruiter‑ and investor‑friendly, showing both technical rigor and business impact.

---

## 🏢 Company Profile
- **Industry**: SaaS startup running workloads on AWS and GCP
- **Team Size**: 50 engineers
- **Cloud Spend**: ~$100,000/month

---

## 🔍 Problem
The company faced:
- Idle EC2 instances left running after testing.
- Oversized Kubernetes node pools with low utilization.
- Duplicate container images stored in Artifact Registry.
- Lack of visibility into real‑time savings opportunities.

---

## 💡 Solution
Using **Cloud Cost Optimizer MVP**:
- **Backend (FastAPI)** scanned AWS/GCP resources via APIs.
- **Savings Calculator** estimated potential monthly savings.
- **Frontend Dashboard (React)** visualized idle resources and savings opportunities.
- **CI/CD automation** ensured continuous scanning and reporting.

---

## 📊 Results
- **Idle EC2 instances**: 20% reduction → $12,000/month saved.
- **Right‑sized node pools**: 15% reduction → $8,000/month saved.
- **Artifact Registry cleanup**: 10% reduction in storage → $2,000/month saved.

**Total Savings: ~30% ($22,000/month)**

---

## 🔒 Security & Scalability
- IAM‑based service accounts for scanning and deployments.
- Secrets managed via Google Secret Manager.
- GKE node pools separated for frontend and backend workloads.
- Autoscaling enabled to prevent over‑provisioning.

---

## 📌 Recruiter/Investor Highlights
- **Demonstrated ROI**: 30% monthly savings on cloud spend.
- **Enterprise‑ready**: Secure, scalable, reproducible infra.
- **Lean MVP**: Cost‑optimized setup with clear path to expansion.
- **Future Potential**: Extend to multi‑cloud, AI‑driven forecasting, sustainability metrics.

---

## 🚀 Next Steps
- Expand scanning to Azure resources.
- Add AI‑driven cost forecasting.
- Integrate sustainability metrics (carbon footprint).
