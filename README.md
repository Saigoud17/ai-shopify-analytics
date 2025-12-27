AI-Powered Shopify Analytics App
Overview

This project is a mini AI-powered analytics application for Shopify stores.
It allows store owners to ask natural-language business questions related to sales, inventory, and customers.

The system interprets the question, generates a ShopifyQL-style analytics query, and returns a simple, business-friendly answer.

The main focus of this assignment is system design, agent reasoning, and API architecture, not production deployment.

High-Level Architecture

The application is designed using a microservice approach:

User
  ↓
Rails API (Gateway)
  ↓
Python AI Service (Agent)
  ↓
ShopifyQL (mocked)
  ↓
Human-readable insight

Components

Rails API (Gateway)

Accepts user questions

Handles request validation

Forwards questions to the AI service

Returns formatted responses

Python AI Service (FastAPI)

Acts as an AI agent

Detects user intent (sales, inventory, customers)

Generates ShopifyQL queries

Explains results in simple language

Exposes Swagger UI for testing

Tech Stack

Backend Gateway: Ruby on Rails (API-only)

AI Service: Python + FastAPI

AI Logic: Agent-based reasoning (LLM-ready, mocked)

Analytics Language: ShopifyQL (simulated)

API Docs: Swagger UI

Version Control: Git + GitHub

Project Structure
ai-shopify-analytics/
│
├── ai-service/        # Python FastAPI AI agent
│   ├── main.py
│   ├── requirements.txt
│
├── rails-api/         # Rails API gateway
│   ├── app/
│   ├── config/
│   ├── Gemfile
│
├── .gitignore
└── README.md

How to Run the Project Locally
1️⃣ Run the Python AI Service (Required)

This is the core working service for the assignment.

Setup
cd ai-service
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt

Start the server
uvicorn main:app --reload

Swagger UI

Open in browser:

http://127.0.0.1:8000/docs


You can test the AI agent directly from Swagger.

2️⃣ Rails API (Gateway)

The Rails API is implemented as a gateway layer that forwards requests to the Python AI service.

⚠️ Note:
On Windows, Ruby native gem dependencies can cause installation issues.
The Rails API code is included for design and architecture evaluation, which is the main focus of this assignment.

The Rails API endpoint design:

POST /api/v1/questions


Example request body:

{
  "store_id": "demo.myshopify.com",
  "question": "Which products are likely to go out of stock in 7 days?"
}

Example AI Request
Request
POST /ask
{
  "shop": "demo.myshopify.com",
  "token": "test-token",
  "question": "Which products are likely to go out of stock in 7 days?"
}

Response
{
  "intent": "inventory",
  "shopifyql": "FROM inventory_levels SHOW available WHERE available < 10",
  "answer": "Based on recent sales, you sell around 10 units per day. To avoid stockouts in the next 7 days, you should reorder at least 70 units.",
  "confidence": "high"
}

Agent Workflow

The AI agent follows these steps:

Understand the user question

Detect intent (sales / inventory / customers)

Identify required data

Generate ShopifyQL query

Validate logic and handle ambiguity

Explain results in plain business language

Notes & Assumptions

Shopify OAuth and live API calls are mocked

ShopifyQL execution is simulated

Architecture is designed to be LLM-ready

Focus is on reasoning, clarity, and system design
