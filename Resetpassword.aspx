<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resetpassword.aspx.cs" Inherits="Newsletter.Resetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
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

        .btn-reset {
            background-color: forestgreen;
            color: white;
        }

            .btn-reset:hover {
                background-color: darkgreen;
            }

        .feedback-message {
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-container">
                <h1>Reset Password</h1>
                <div class="mt-3">
                    <asp:Label ID="LblMesg" runat="server" CssClass="text-danger"></asp:Label>
                </div>
                <!-- Email Field -->
                <div class="mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address" TextMode="Email" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="regexValidatorEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Invalid email format." CssClass="text-danger"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic" />
                </div>

                <!-- New Password Field -->
                <div class="mb-3">
                    <asp:TextBox ID="txtnewpass" runat="server" CssClass="form-control" placeholder="New Password" TextMode="Password" />
                    <asp:RegularExpressionValidator ID="regexValidatorPassword" runat="server" ControlToValidate="txtnewpass"
                        ErrorMessage="Password must be at least 8 characters long, contain at least 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character." CssClass="text-danger"
                        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$" Display="Dynamic" />
                </div>

                <!-- Confirm Password Field -->
                <div class="mb-3">
                    <asp:TextBox ID="txtconpass" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password" />
                </div>

                <!-- Reset Password Button -->
                <div class="d-grid">
                    <asp:Button ID="btnreset" runat="server" CssClass="btn btn-reset" Text="Reset Password" OnClick="btnreset_Click" />
                </div>

                <!-- Feedback Message -->
                <div class="feedback-message">
                    <asp:Label ID="lblFeedback" runat="server" />
                </div>
            </div>
        </div>
    </form>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
