# Asimos — Architecture Summary

## Overview
Asimos is a PHP + HTML based school management UI (procedural PHP). It uses server-side PHP pages for routing and MySQL for persistence.

## High-level components
- `index.php` — Public landing / entry point.
- `register.html` / `register_handler.php` — User registration form and server-side handler.
- `adminDashboard.php`, `studentDashboard.php`, `teachersDashboard.php` — Role-based dashboards (server-side rendered).
- `partials/` — Shared UI parts (header/footer/sidebar).
- `backoffice/`, `student/`, `forms/` — Functional areas (student management, back-office features, forms).
- `assets/` — CSS, JS, images, third-party libs.

## Data storage
- MySQL (see `asimos_Sql_Schema.sql` in repo). Use a single DB user with minimal privileges for the app (SELECT/INSERT/UPDATE/DELETE).

## Security design notes
- Use prepared statements for all DB operations (avoid SQL injection).
- Use `password_hash()` and `password_verify()` for password storage/validation.
- Add CSRF tokens for all forms that change state.
- Escape all user-controlled values in HTML with `htmlspecialchars($value, ENT_QUOTES, 'UTF-8')`.
- Store DB credentials outside webroot or in a config file excluded from git via `.gitignore`.

## Development workflow
1. Clone repository.
2. Create a `.env` file or update `config.php` with DB credentials locally.
3. Run SQL schema in `asimos_Sql_Schema.sql`.
4. Test locally on XAMPP/LAMP/WAMP.
5. Submit PRs for code changes; server-side testing performed locally.

## Files to check first for security fixes
- `register.html` / `register_handler.php` (or `register.php` if present)
- `login.php`
- `dbconnect.php` (create / centralize)
- Any page that handles `$_POST` or `$_GET` input

---
