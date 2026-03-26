<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        :root {
            --primary-blue: #2563eb;
            --bg-color: #f3f4f6;
            --text-dark: #1f2937;
            --text-muted: #6b7280;
            --border-color: #e5e7eb;
        }
        
        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-dark);
            margin: 0;
            padding: 0;
        }

        /* Top Navigation Bar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 1rem 3rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .welcome-msg {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--primary-blue);
        }

        .logout-btn {
            background-color: #ef4444;
            color: #ffffff;
            padding: 0.5rem 1.5rem;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: background-color 0.2s ease-in-out;
            border: none;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #dc2626;
        }

        /* Dashboard Content Container */
        .dashboard-container {
            max-width: 1000px;
            margin: 3rem auto;
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .dashboard-header h2 {
            margin: 0 0 1.5rem 0;
            color: var(--text-dark);
            font-size: 1.5rem;
            border-bottom: 2px solid var(--border-color);
            padding-bottom: 1rem;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 1rem;
        }

        th, td {
            padding: 1rem 1.5rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }

        th {
            background-color: #f8fafc;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.05em;
        }

		th:first-child, td:first-child { 
            width: 5%; 
            text-align: center;
        }
        
        th:first-child { border-top-left-radius: 8px; }
        th:last-child { border-top-right-radius: 8px; }

        tr {
            transition: background-color 0.15s ease-in-out;
        }

        tr:hover {
            background-color: #f8fafc;
        }

        td {
            font-size: 0.95rem;
        }
        
        .sl-no {
            font-weight: 600;
            color: var(--text-muted);
        }

        .role-badge {
            background-color: #dbeafe;
            color: #1e40af;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .empty-state {
            text-align: center;
            color: var(--text-muted);
            padding: 2rem !important;
            font-style: italic;
        }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="welcome-msg">
            Welcome, <s:property value="fullname" />
        </div>
        <a href="<s:url action='showLogin'/>" class="logout-btn">Logout</a>
    </nav>

    <div class="dashboard-container">
        <div class="dashboard-header">
            <h2>Employee Directory</h2>
        </div>

        <table>
            <thead>
                <tr>
                		<th>Sl.No</th>
                    <th>Full Name</th>
                    <th>Email Address</th>
                    <th>Password</th>
                    <th>Role</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="userList" status="stat">
                    <tr>
                    		<td class="sl-no"><s:property value="#stat.count"/></td>
                        <td><s:property value="fullname" /></td>
                        <td><s:property value="email" /></td>
                        <td><s:property value="password"/></td>
                        <td><span class="role-badge"><s:property value="role"/></span></td>
                    </tr>
                </s:iterator>
                
                <s:if test="userList.isEmpty()">
                    <tr>
                        <td colspan="4" class="empty-state">No standard users found in the system.</td>
                    </tr>
                </s:if>
            </tbody>
        </table>
    </div>

</body>
</html>