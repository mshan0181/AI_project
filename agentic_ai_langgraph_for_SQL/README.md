  🧠 Agentic MySQL AI — Run SQL Operations in Your Database Using Natural Language
  -------------------------------------------------------------------------------------

Powered by LangGraph + LangChain + Gemini AI + MCP + Gradio

💡 Overview
---------------

This project demonstrates how to build an Agentic AI system that allows you to query and execute SQL operations on a live MySQL database — using natural language commands instead of writing SQL manually.

It integrates:

🧩 LangGraph — for defining the agent’s workflow as a graph (nodes + edges).

🧠 LangChain — for managing prompts and model orchestration.

🔮 Gemini AI (Google Generative AI) — for generating intelligent SQL queries.

⚙️ MCP (Model Context Protocol) Server — for schema fetching and executing queries on a real MySQL database.

💬 Gradio — for creating an intuitive web UI to interact with the AI agent.

⚙️ Architecture Overview
------------------------------
🧭 How It Works

User Input:
You provide a natural language query such as —
“Create a table employees with id, name, department, and salary.”

LangGraph Workflow:
-------------------
LangGraph orchestrates this flow through multiple nodes:

🟣 fetch_schema → MCP Server retrieves MySQL schema.

🔵 generate_sql → Gemini AI converts text → SQL.

🟢 execute_sql → MCP Server runs query and returns results.

⚪ END → Response is displayed on Gradio UI.

MCP Server:
Acts as a bridge between LangGraph and the MySQL database for schema + SQL execution.

Gradio UI:
The interactive web app where you can input natural language and see generated SQL + execution results.

🗂️ Project Structure
----------------------
agentic-mysql-ai/
│

├── gradio_agentic_ui.py                # Gradio frontend for user interaction

├── langgraph_schema_graph.py           # LangGraph workflow (core logic)

├── mysql_mcp_server.py                 # MCP server connecting to MySQL

├── requirements.txt                    # Dependencies

├── run_all.sh                          # Shell script to launch everything

├── verify_gemini.py                    # Gemini API verification

├── venv/                               # Virtual environment

└── .env                                # API keys and MySQL credentials

🧩 Setup Instructions
-------------------------
1️⃣ Clone the Repository
git clone https://github.com/YOUR_GITHUB_USERNAME/agentic-mysql-ai.git
cd agentic-mysql-ai

2️⃣ Create a Virtual Environment
python3 -m venv venv
source venv/bin/activate

3️⃣ Install Dependencies
pip install -r requirements.txt

4️⃣ Set Up Environment Variables

Create a .env file:

GEMINI_API_KEY=your_google_gemini_api_key
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=your_password
MYSQL_DATABASE=testdb

5️⃣ Start the MCP Server
uvicorn mysql_mcp_server:app --host 0.0.0.0 --port 8080

6️⃣ Launch the Gradio App
python gradio_agentic_ui.py


Then open your browser at:
👉 http://localhost:7860

🧠 Example Queries
---------------------
You can try:

🏗️ Create a table employees with id int primary key, name varchar(100), department varchar(50), and salary decimal(10,2)

➕ Insert a new employee named Alice in the Marketing department with a salary of 50000.

✏️ Update salary to 55000 for Alice.

❌ Delete employee named Alice.

📊 Display all employees from the Marketing department.

🌐 Architecture Diagram
-------------------------------

🖼️ architecture-diagram.png

🔗 LinkedIn Article
--------------------

📘 Read the full implementation walkthrough and explanation on LinkedIn:
👉 LinkedIn Article: Building an Agentic MySQL AI – Run SQL Operations via Natural Language

💻 Tech Stack
----------------------
Component	              Role
LangGraph	              Workflow orchestration & state management
LangChain	              Prompt and model handling
Gemini AI            	  SQL generation and reasoning
MCP Server (FastAPI)	  MySQL schema and query execution
Gradio	                Interactive user interface


🧩 Future Enhancements
------------------------
🔄 Add support for multiple databases (PostgreSQL, Oracle).

🧠 Integrate LangSmith for better tracing and debugging.

🕵️ Add schema visualization and SQL explain plans.

🌍 Deploy via Docker + Streamlit Cloud.

🏁 Conclusion
--------------------
This project showcases how Agentic AI can transform traditional database operations — turning natural human language into executable SQL.
With LangGraph as the brain, Gemini AI as the reasoning engine, and Gradio as the UI, developers can now run SQL operations intuitively, safely, and efficiently.
