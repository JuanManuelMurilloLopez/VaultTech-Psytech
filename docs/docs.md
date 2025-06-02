# VaultTech-Psytech: High-Level Documentation
## Overview

VaultTech-Psytech is a Node.js/Express web application for administering, applying, and analyzing psychometric tests (e.g., OTIS, Hartman, 16PF, Kostick, Terman, Colores) to students/aspirants, managed by expert psychologists. The system supports user authentication, group/institution management, test assignment, document uploads, and automated notifications.

## Main Features
- User Authentication: OTP-based login for security.
- User Roles:
  - Aspirante (Student/Test-taker)
  - Psicologo (Psychologist/Expert)
- Group & Institution Management: Psychologists manage groups, assign tests, and register institutions.
- Test Application: Multiple psychometric tests with custom flows, instructions, and result analysis.
- Document Management: Upload and track required documents (CV, Kardex).
- Automated Notifications: Cron jobs to remind users about missing documents.
- Result Analysis: Psychologists can view, analyze, and interpret test results.

## High-Level Architecture
```mermaid
flowchart TD
    subgraph Client
        Browser
    end

    subgraph Server
        App[Express App (app.js)]
        Routes[Routes]
        Controllers[Controllers]
        Models[Models]
        Views[EJS Views]
        Middleware[Middleware]
        Scripts[Scripts/Cron]
    end

    subgraph Database
        MySQL[(MySQL)]
    end

    Browser -- HTTP/HTTPS --> App
    App --> Middleware
    App --> Routes
    Routes --> Controllers
    Controllers --> Models
    Controllers --> Views
    Models -- SQL --> MySQL
    Scripts -- SQL --> MySQL
    Scripts -- Email --> EmailService
```

## Main Modules

### 1. Entry Point (`app.js`)
- Sets up Express, session, security (Helmet), compression, static files, EJS view engine, body parsing, and file uploads (Multer).
- Registers routes for login, aspirante, and psicologo.
- Schedules cron jobs for notifications.

### 2. Routes
- **inicioSesion.routes.js**: Login, OTP, logout.
- **aspirante.routes.js**: All aspirant flows (tests, documents, forms).
- **psicologo.routes.js**: Psychologist dashboard, group/institution management, test analysis.

### 3. Controllers
- **aspirante.controller.js**: Handles all aspirant actions (test flows, uploads, forms).
- **psicologo.controller.js**: Handles psychologist actions (group/test management, analysis).
- **inicioSesion.controller.js**: Handles authentication and OTP.

### 4. Models
- **User/Role Models**: `usuario.model.js`, `psicologo.model.js`, `aspirante.model.js`
- **Group/Institution Models**: `grupo.model.js`, `institucion.model.js`
- **Test Models**: `prueba.model.js`, `hartman.model.js`, `respondeKostick.model.js`, etc.
- **Result Models**: `resultadosKostick.model.js`, `resultados16PF.model.js`, etc.
- **Auxiliary Models**: For catalogues, options, questions, etc.

### 5. Views
- EJS templates for all user-facing pages, separated by role and feature.

### 6. Scripts
- **sendDocumentNotifications.js**: Cron job for sending document reminders.

## User Flows

### 1. Authentication & Role Routing

```mermaid
sequenceDiagram
    participant U as User
    participant S as Server
    participant DB as Database

    U->>S: POST /login (username)
    S->>DB: Fetch user
    DB-->>S: User data
    S->>S: Generate OTP, send email
    S-->>U: Redirect to /otp

    U->>S: POST /otp (code)
    S->>DB: Validate OTP
    DB-->>S: OTP valid?
    alt Aspirante
        S-->>U: Redirect to /aspirante/mis-pruebas
    else Psicologo
        S-->>U: Redirect to /psicologo/lista-grupos
    end
```

### 2. Test Assignment & Application

```mermaid
flowchart TD
    Psicologo -- Assigns group/tests --> Grupo
    Grupo -- Contains --> Aspirante
    Aspirante -- Takes --> Prueba
    Prueba -- Stores results --> Database
    Psicologo -- Views/Analyzes --> Resultados
```

### 3. Document Upload & Notification

```mermaid
sequenceDiagram
    participant A as Aspirante
    participant S as Server
    participant DB as Database
    participant Cron as CronJob

    A->>S: Upload CV/Kardex
    S->>DB: Store file info

    Cron->>DB: Check missing documents
    Cron->>S: Send email notification if missing
```

## Database (ER) Diagram (Simplified)

```mermaid
erDiagram
    USUARIOS ||--o{ ASPIRANTES : has
    USUARIOS ||--o{ PSICOLOGOS : has
    ASPIRANTES ||--o{ GRUPOSASPIRANTES : belongs_to
    GRUPOS ||--o{ GRUPOSASPIRANTES : has
    GRUPOS ||--o{ GRUPOSPRUEBAS : assigns
    PRUEBAS ||--o{ GRUPOSPRUEBAS : assigned
    ASPIRANTES ||--o{ ASPIRANTESGRUPOSPRUEBAS : takes
    GRUPOS ||--o{ ASPIRANTESGRUPOSPRUEBAS : contains
    PRUEBAS ||--o{ ASPIRANTESGRUPOSPRUEBAS : is
    ASPIRANTES ||--o{ RESPUESTAS : answers
    PRUEBAS ||--o{ RESPUESTAS : for
    ASPIRANTES ||--o{ RESULTADOS : has
    PRUEBAS ||--o{ RESULTADOS : for
    INSTITUCION ||--o{ GRUPOS : has
```

## Psychometric Tests Supported

- **OTIS**: Verbal, logical, spatial, and numerical reasoning.
- **Hartman**: Value profile, two-phase ranking.
- **16PF**: Personality factors.
- **Kostick**: Work personality.
- **Terman**: Mental aptitude.
- **Colores**: Color-based personality/decision test.

Each test has:
- Instructions
- Personal data form
- Question/answer flow
- Result calculation and storage
- Psychologist analysis view

## Onboarding Checklist for New Engineers

1. **Clone the repository** and install dependencies.
2. **Set up the database** using `psytech.sql`.
3. **Configure environment variables** (see `.env.example` or ask a lead).
4. **Run the app**: `node Psytech/app.js` (or use `npm start` if available).
5. **Explore the codebase**:
    - Start with `app.js` for the app structure.
    - Review routes and controllers for user flows.
    - Check models for data structure.
    - Look at EJS views for UI.
6. **Understand the test flows** by following the aspirante and psicologo routes.
7. **Check the cron job** in `scripts/sendDocumentNotifications.js` for automated features.

## Useful Diagrams

### System Overview

```mermaid
graph TD
    subgraph Web_Client
        A[Login/Tests/Results]
    end
    subgraph NodeJS_Server
        B[Express App]
        C[Controllers]
        D[Models]
        E[Views]
        F[Middleware]
        G[Cron Jobs]
    end
    subgraph MySQL
        H[(DB)]
    end
    A-->|HTTP|B
    B-->|Routes|C
    C-->|ORM/SQL|D
    D-->|SQL|H
    C-->|Render|E
    B-->|Session/Auth|F
    G-->|Automated Tasks|D
```

## Additional Notes

- **Security**: Uses Helmet, session management, and OTP for login.
- **File Uploads**: Multer for CV/Kardex and Excel imports.
- **Notifications**: Automated email reminders for missing documents.
- **Extensibility**: New tests can be added by extending models, controllers, and views.

**For more details, see the code in each module and the SQL schema for full table definitions.**