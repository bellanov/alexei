# Alexei
An **Observability** & **Reporting** platform.

Measure the performance of your *Solution Architecture*. How **effective** is your solution at **solving** the problem?

Measure the effectiveness of your *Cloud Architecture*. Measure the **availability** and **resilience** of the cloud in **delivering** the solution.

Measure adherence to **compliance** by both the *Solution* and *Cloud Architecture*.

**Visualize** and **control** aspects of your *Cloud Architecture* via an interactive _Drag-and-Drop_ interface.

## Core Ideas

- Formal **interface** to _monitoring_, _observability_, and _reporting_.
- Deployed in **_Google Cloud Platform (GCP)_** with a _Drag-and-Drop_ *interface* to the cloud provider.
- For **_client-facing_** applications and services, **_App Engine_** is considered for all of its benefits OOTB.
- Monitoring, observing, and reporting will be **_lazily loaded_** as **_Cloud Run_** containers as a means to be as cost-efficient as possible (experiment!@!).
  - Components are spun up and utilized only when they're needed to **_execute_**.
  - Cloud Run is just **_painless_** container management.
- As a general rule of thumb, for **_CPU-intensive_** workloads, **_compute_** instances should be procured with appropriate **_scaling groups_**; otherwise utilize **_cloud_** / **_lambda_** / **_serverless_** functions.
- Services that aren't **_CPU-intensive_** are **_lazily loaded_** whenever possible. 

## Architecture

The projects and potential relationships between **_nebulyzer_** and an example architecture are defined in the diagram below.

The **architecture** diagram is currently being constructed.

## Dev Workflow

Develop and test changes in the *dev* environment.

```bash
cd ./environments/dev
terraform init
terraform plan
terraform apply
terraform destroy
```

## Staging Workflow

Preview changes with prod resources in the *staging* environment.

```bash
cd ./environments/staging
terraform init
terraform plan
terraform apply
```

## Prod Workflow

Once changes have been tested, you can promote your configuration to prodution.

```bash
cd ./environments/prod
terraform init
terraform plan
terraform apply
```
