######cat gradio_agentic_ui.py
import gradio as gr, json
from langgraph_schema_graph import run_schema_validation_workflow

def handle(user_input):
    state = run_schema_validation_workflow(user_input)
    return json.dumps(state, indent=2, default=str)

with gr.Blocks(title="Agentic AI for MySQL") as demo:
    gr.Markdown("# 🤖 Agentic MySQL AI (Schema-Aware)")
    inp = gr.Textbox(label="Enter your natural language query:")
    out = gr.Textbox(label="AI Generated SQL & Results", lines=20)
    btn = gr.Button("🚀 Run")
    btn.click(fn=handle, inputs=inp, outputs=out)

demo.launch(server_name="0.0.0.0", server_port=7860)