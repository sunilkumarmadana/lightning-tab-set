# Source Register: seed sources checked on 2026-10-10

This is the starting allowlist and seed list for ingestion (Day 1). Each row records what I found when I checked the source while writing the build plan. The ingestion job will re-verify every row on its first run; treat this file as a snapshot, not a live record.

## Tier 1: official Salesforce documentation

| Source | URL | Access method | Observed 2026-10-10 |
|---|---|---|---|
| Docs-wide LLM index | `https://developer.salesforce.com/docs/llms.txt` | Plain fetch | Lists product indexes (Data Cloud/Data 360, Diagrams, Industries, Industries Integrations, GenAI/Agentforce, Hosted MCP Servers, Sales Cloud, Service Cloud, Metadata Coverage, product docs). Includes an instruction addressed to LLM agents to prefer the official docs. |
| Site-wide LLM index | `https://developer.salesforce.com/llms.txt` | Plain fetch | Referenced from `robots.txt` as "LLM and AI agent friendly content". |
| Data Model Gallery index | `https://developer.salesforce.com/docs/llms-diagrams.txt` | Plain fetch | Lists every gallery page as a `.md` URL. Categories include Sales, Service, Financial Services, Health, Data 360, Nonprofit (+ Nonprofit Success Pack), Automotive, Insurance, Platform, and others. |
| Data Model Gallery pages | `https://developer.salesforce.com/docs/platform/data-models/guide/<slug>.md` | Plain fetch (`text/markdown`) | Each page has a description, "Entities/Objects Included" (labels, not API names), a PNG diagram URL, a Lucidchart template link, and "More Info" links. **Relationships appear only in the PNG.** The HTML pages carry `robots: noindex,nofollow,nosnippet`. The note on the index page says cloud names are Agentforce-branded (for example Sales Cloud is now Agentforce Sales). |
| Data 360 LLM index | `https://developer.salesforce.com/docs/llms-data-cloud.txt` | Plain fetch | Includes Snowflake connector, federation (Snowflake, BigQuery, Databricks, Redshift), DMO, data stream and metadata pages. **One listed URL (`.../guide/c360-integration.md`) returned 404**, which is evidence that link-rot checks are needed. |
| Snowflake connector (Data 360) | `https://developer.salesforce.com/docs/data/data-cloud-int/guide/c360-a-snowflake-connector.md` | Plain fetch | GA; bidirectional; "Zero Copy (Query Federation, File Federation, Data Share)". |
| Snowflake federation setup | `https://developer.salesforce.com/docs/data/data-cloud-int/guide/c360-a-set-up-data-federation-snowflake-connection.md` | Plain fetch | Key-pair auth or Salesforce IDP auth (Snowflake `WORKLOAD_IDENTITY` OIDC service user); IP allowlist; Private Connect option; requires System Admin or Data Cloud Architect permission set. |
| Agentforce Financial Services Developer Guide (formerly FSC) | `https://developer.salesforce.com/docs/atlas.en-us.financial_services_cloud_object_reference.meta/financial_services_cloud_object_reference/` | Versioned atlas URLs (`atlas.en-us.<release>.0...`); release PDF at `resources.docs.salesforce.com/264/latest/en-us/sfdc/pdf/fsc_dev_guide.pdf` | Latest = Winter '27 (API 68.0); versions back to Winter '17 listed. Managed-package custom objects are one API version behind core; standard FSC objects match core. Object pages state "available in API version X and later" (for example `FinancialAccountParty`, `FinancialAccountTransaction` and `FinancialAccountAddress`: v61.0). |
| Object Reference for the Salesforce Platform | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_list.htm` | Versioned atlas URLs | Standard object list with "available in API version" notes. Need to verify the `.md` route on day 1. |
| Health developer guide | `https://developer.salesforce.com/docs/atlas.en-us.health_cloud_object_reference.meta/health_cloud_object_reference/` | Versioned atlas URLs | Linked from the gallery's Health Overview page. |
| Data 360 standard DMO reference | `https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/c360dm_DataModelObjects.htm` | Versioned atlas URLs | Linked from the gallery's Data 360 Financial Services Overview. |
| Salesforce Help (admin docs, release notes) | `https://help.salesforce.com/s/articleView?id=<id>&release=<num>&type=5` | **Browser Run** (JS-rendered) | `robots.txt` allows articles and lists sitemaps per product type: `release-notes`, `ind`, `data`, `sales`, `service`, `platform`, `ai`, and others. |
| Release Note Changes | `https://help.salesforce.com/s/articleView?id=release-notes.rn_change_log.htm&release=<num>&type=5` | Browser Run | Post-GA corrections log, grouped by area. |
| Data 360 release-notes changes | `https://help.salesforce.com/s/articleView?id=sf.c360_a_changelog.htm&type=5` | Browser Run | Data 360 ships "as often as monthly". |
| Data 360 enrichments | `https://help.salesforce.com/s/articleView?id=data.c360_a_enrich_your_org_with_data_and_insights.htm&type=5` | Browser Run | Copy field and related list enrichments. |
| Data 360-triggered flows | `https://help.salesforce.com/s/articleView?id=platform.flow_concepts_trigger_data_cloud.htm&type=5` | Browser Run | Flows that start when DMO conditions are met. |
| Architect site | `https://architect.salesforce.com` (sitemap: `/sitemap.xml`) | Sitemap | `robots.txt`: `User-agent: * / Allow: /`. Note the hostname is **architect** (singular); `architects.salesforce.com` does not resolve. |

## Release and API version mapping (seed)

| Release | Release # | API version | Source |
|---|---|---|---|
| Winter '27 | 264 | 68.0 | FSC developer guide version selector |
| Summer '26 | 262 | 67.0 | same |
| Spring '26 | 260 | 66.0 | same |
| Winter '26 | 258 | 65.0 | same |

## Product renames (seed alias registry)

| Current name | Former name(s) | Source |
|---|---|---|
| Data 360 | Data Cloud (and earlier: Salesforce Genie, Salesforce CDP, Customer 360 Audiences) | `llms.txt` ("Salesforce Data 360 (formerly Data Cloud)"); earlier names from secondary coverage, so verify before use |
| Agentforce Financial Services | Financial Services Cloud | FSC developer guide header |
| Agentforce Sales | Sales Cloud | Data Model Gallery note |

## Capability products (for capability packs)

| Name | What it is (official wording) | Source |
|---|---|---|
| Claudeforce | Salesforce and Anthropic expanded partnership, announced 2026-08-26 | Salesforce press release, 2026-08-26 |
| AIforce | "Salesforce's trusted enterprise harness that brings all your business data and workflows to any agent through MCP servers, APIs, and CLI tools" | same |
| Salesforce in Claude | Plugin with 37 prebuilt sales skills; pilot at announcement, open beta targeted September 2026 | same |

## Terms and crawling signals

| Item | Finding |
|---|---|
| Salesforce website Terms of Service (`salesforce.com/company/legal/sfdc-website-terms-of-service/`, last updated 2025-04-08) | "You may not use content from our Sites unless you obtain permission from us or its owner, or unless you are otherwise permitted by law." There is no explicit anti-crawler clause, but the Terms forbid interfering with the Sites, including any technological measures used to enforce the Terms. |
| `developer.salesforce.com/robots.txt` | Disallows search and query-string patterns only; lists sitemaps and both `llms.txt` files. |
| `help.salesforce.com/robots.txt` | Allows `/` broadly; disallows search, case and portal paths and a few specific articles; blocks Baiduspider. |
| `architect.salesforce.com/robots.txt` | Allows everything. |

## Non-Salesforce platform references used in the plan

| Item | Source |
|---|---|
| Perplexity MCP server (`@perplexity-ai/mcp-server`; remote `https://api.perplexity.ai/mcp`) | `github.com/perplexityai/modelcontextprotocol` README |
| Cloudflare AI Search (hybrid search on by default, metadata filtering, relevance boosting, MCP endpoint) | `developers.cloudflare.com/ai-search/` (last updated 2026-10-01); changelog 2026-04-16 |
| Cloudflare Browser Run (formerly Browser Rendering; crawl and markdown endpoints) | `developers.cloudflare.com/browser-run/` |
| Cloudflare Access for Workers + JWT validation (`Cf-Access-Jwt-Assertion`) | `developers.cloudflare.com/cloudflare-one/access-controls/applications/http-apps/authorization-cookie/validating-json/`; `developers.cloudflare.com/workers/configuration/cloudflare-access/` |
| Workers VPC (Worker → Tunnel → private service) | `developers.cloudflare.com/workers-vpc/` |
| Workers AI STT models and prices (`whisper-large-v3-turbo` $0.0005/min; `nova-3` $0.0052/min) | `developers.cloudflare.com/workers-ai/platform/pricing/` |
| Claude `search_result` content blocks with citations; incompatibility of citations with structured outputs | `platform.claude.com/docs/en/build-with-claude/search-results`; Claude API skill reference |
