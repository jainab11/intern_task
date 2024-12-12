<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Newsletter.ForgotPassword" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-container {
            max-width: 400px;
            margin: 100px auto;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px 30px;
        }

        .form-container h1 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
            color: #343a40;
        }

        .btn-submit {
            background-color: forestgreen;
            color: white;
        }

        .btn-submit:hover {
            background-color: darkgreen;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Panel ID="formPanel" runat="server" Visible="true">
                <div class="form-container">
                    <h1>Forgot Password</h1>
                    <div class="mb-3">
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter your registered email" />
                    </div>
                    <div class="d-grid">
                        <asp:Button ID="Submitbtn" runat="server" CssClass="btn btn-submit" Text="Submit" OnClick="Submitbtn_Click" />
                    </div>
                </div>
            </asp:Panel>
            <div class="mt-3">
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
