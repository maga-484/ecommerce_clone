# E-Commerce Clone

> A full-stack e-commerce application built with React, Express, Prisma, and MySQL.
> Portfolio project demonstrating database modeling, REST API design, and modern frontend development.

![Status](https://img.shields.io/badge/status-completed-success)
![License](https://img.shields.io/badge/license-MIT-blue)
![Node](https://img.shields.io/badge/node-%3E%3D18-brightgreen)
![React](https://img.shields.io/badge/react-18-61dafb)

> **Note:** Educational project. This is not affiliated with any real e-commerce company and does not process real payments. It was built for learning and portfolio purposes only.

---

## Features

- **Product catalog** with pagination and category filters
- **Product detail page** with reviews and stock per store
- **Shopping cart** persisted in localStorage
- **Checkout flow** that creates an order + order lines + payment in a single database transaction
- **Order history** per customer with status tracking
- **Responsive UI** built with plain CSS
- **Centralized error handling** on the backend
- **CORS** configured for local frontend development

---

## Tech Stack

| Layer         | Technology                          |
| ------------- | ----------------------------------- |
| **Frontend**  | React 18, Vite, React Router, Axios |
| **Backend**   | Node.js, Express, Prisma ORM        |
| **Database**  | MySQL / MariaDB                     |
| **Styling**   | Plain CSS                           |
| **Dev Tools** | Nodemon, ESLint                     |

---

## Data Model

The database follows a **normalized design (3NF)** with **13 tables** and **15+ relationships**:

| Table        | Description                        |
| ------------ | ---------------------------------- |
| categoria    | Product categories                 |
| subcategoria | Subcategories per category         |
| marca        | Product brands                     |
| proveedor    | Suppliers                          |
| producto     | Products (main table, 50+ records) |
| cliente      | Customers                          |
| sucursal     | Physical stores                    |
| stock        | Stock per product per store        |
| envio        | Shipping information               |
| pedido       | Orders                             |
| linea_pedido | Order line items                   |
| pago         | Payments                           |
| resena       | Product reviews                    |

---

## Getting Started

### Prerequisites

- Node.js >= 18
- MySQL or MariaDB >= 10.4
- npm or yarn

### 1. Clone the repository

    git clone https://github.com/maga-484/ecommerce-clone.git
    cd ecommerce-clone

### 2. Set up the database

    cd database
    mysql -u root -p < schema.sql
    mysql -u root -p < seed.sql

### 3. Set up the backend

    cd ../backend
    npm install
    npx prisma generate
    npm run dev

Create a .env file in backend/:

    DATABASE_URL="mysql://root:your_password@localhost:3306/ecommerce_clone"
    PORT=3002
    NODE_ENV=development
    FRONTEND_URL=http://localhost:5173

### 4. Set up the frontend

    cd ../frontend
    npm install
    npm run dev

Create a .env file in frontend/:

    VITE_API_URL=http://localhost:3002/api

---

## API Endpoints

### Products

| Method | Endpoint                   | Description                       |
| ------ | -------------------------- | --------------------------------- |
| GET    | /api/productos             | List products                     |
| GET    | /api/productos/:id         | Get product detail with reviews   |
| GET    | /api/productos/:id/resenas | Get reviews for a product         |
| GET    | /api/productos/:id/stock   | Get stock per store for a product |

### Categories

| Method | Endpoint                          | Description                      |
| ------ | --------------------------------- | -------------------------------- |
| GET    | /api/categorias                   | List all categories              |
| GET    | /api/categorias/:id/subcategorias | List subcategories of a category |

### Customers

| Method | Endpoint                  | Description                   |
| ------ | ------------------------- | ----------------------------- |
| GET    | /api/clientes             | List all customers            |
| GET    | /api/clientes/:id         | Get customer detail           |
| GET    | /api/clientes/:id/pedidos | Get all orders for a customer |

### Orders

| Method | Endpoint                | Description         |
| ------ | ----------------------- | ------------------- |
| GET    | /api/pedidos            | List all orders     |
| GET    | /api/pedidos/:id        | Get order detail    |
| POST   | /api/pedidos            | Create a new order  |
| PATCH  | /api/pedidos/:id/estado | Update order status |

### Payments

| Method | Endpoint       | Description        |
| ------ | -------------- | ------------------ |
| GET    | /api/pagos     | List all payments  |
| GET    | /api/pagos/:id | Get payment detail |

### Reviews

| Method | Endpoint     | Description         |
| ------ | ------------ | ------------------- |
| GET    | /api/resenas | List reviews        |
| POST   | /api/resenas | Create a new review |

### Health

| Method | Endpoint    | Description          |
| ------ | ----------- | -------------------- |
| GET    | /api/health | Service health check |

---

## Limitations

This project is not production-ready. For a real-world deployment, the following would be required:

- Authentication and authorization (JWT, OAuth)
- Real payment gateway integration (Mercado Pago, Stripe, etc.)
- PCI DSS compliance for card handling
- Input validation and rate limiting
- Automated tests (unit, integration, e2e)
- CI/CD pipeline
- HTTPS and secure headers

These limitations are intentional and documented. The project was built as a learning exercise and portfolio piece.

---

## Roadmap

- [ ] Add JWT authentication
- [ ] Add admin panel for products and orders
- [ ] Add product image upload
- [ ] Add unit and integration tests
- [ ] Add Docker Compose for one-command setup
- [ ] Deploy frontend to Vercel and backend to Render
- [ ] Add Swagger/OpenAPI documentation

---

## License

MIT (c) Magali Ofelia Gafe

---

## Author

**Magali Ofelia Gafe**

- GitHub: [@maga-484] (https://github.com/maga-484)
- LinkedIn: [magali-gafe] (https://www.linkedin.com/in/magal%C3%AD-gafe-713224ab/)
