# nebulyzer
An **Observability** & **Reporting** platform.

Measure the performance of your *Solution Architecture*. How **effective** is your solution at **solving** the problem?

Measure the effectiveness of your *Cloud Architecture*. Measure the **availability** and **resilience** of the cloud in **delivering** the solution.

Measure adherence to **compliance** by both the *Solution* and *Cloud Architecture*.

## Dependencies

### Backstage

[Backstage](https://backstage.io/)

An open platform for building **developer portals**.

Powered by a **centralized software catalog**, Backstage restores order to your infrastructure and enables your product teams to ship high-quality code quickly — without compromising autonomy.

## Architecture

The projects and potential relationships between **_nebulyzer_** and an example architecture are defined in the diagram below.

![Nebulyzer Diagram](./diagram/nebulyzer_diagram.svg)

## Core Ideas

- As a general rule of thumb, for **_CPU-intensive_** workloads, **_compute_** instances should be procured with appropriate **_scaling groups_**; otherwise utilize **_cloud_** / **_lambda_** functions.
