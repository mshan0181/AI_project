 Agentic MySQL NL → SQL AI (Production Ready Docker Deployment)

Transform Natural Language → SQL automatically with:

✔ LangGraph
✔ Gemini 2.5 Pro
✔ FastAPI MCP Server
✔ Gradio UI
✔ MySQL backend
✔ SSL reverse proxy (nginx + Let’s Encrypt)

 Quick Start
-------------
1) Clone the repo
git clone https://github.com/<yourname>/agentic-ai-mysql.git
cd agentic-ai-mysql

2) Edit environment variables
cp .env.example .env
nano .env

3) Load AI image
docker load -i agentic-ai-mysql.tar

4) Run full stack
docker compose up -d

5)  Access the UI
https://<your-domain>

Services
-----------
Service	Description	Port
agentic_app	Gradio UI + FastAPI MCP Server	7860 / 8080
mysql	MySQL DB	3306
nginx-proxy	Reverse proxy	80/443
letsencrypt	Auto SSL	-

 Using NL → SQL Workflow
-------------------------

Enter natural language like:

“create a table employees with id, name, role, salary”

AI will:

Fetch MySQL schema

Generate safe SQL

Execute SQL

Show results

Update schema graph


 Advanced
----------

Update image
docker build -t agentic-ai-mysql:latest .
docker save -o agentic-ai-mysql.tar agentic-ai-mysql:latest

 Portable Deployment
----------------------

To deploy on another machine:

tar -xzvf agentic-ai-mysql-portable.tar.gz
docker load -i agentic-ai-mysql.tar
cp .env.example .env
docker compose up -d


Done. 

 Multi-User / Production Ready
-------------------------------

This build:

✔ Supports multiple users
✔ Auto-configures SSL
✔ Auto-detects schema
✔ Safe SQL generation (no destructive operations)
✔ Stateless — works on any MySQL backend
✔ Can be run on any cloud VM

Folder Structure
.
├── app/
├── docker-compose.yml
├── Dockerfile
├── agentic-ai-mysql.tar
├── .env.example
└── README.md

