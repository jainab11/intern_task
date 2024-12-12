<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration page.aspx.cs" Inherits="Newsletter.Registration_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>AdminLTE 4 | Register Page</title>
    <!--begin::Primary Meta Tags-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="title" content="AdminLTE 4 | Register Page" />
    <meta name="author" content="ColorlibHQ" />
    <meta name="description" content="AdminLTE is a Free Bootstrap 5 Admin Dashboard, 30 example pages using Vanilla JS." />
    <link href="css/adminlte.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
    <link href="css/jlr_fonts.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/styles/overlayscrollbars.min.css" integrity="" crossorigin="anonymous" />
    <!--end::Third Party Plugin(OverlayScrollbars)-->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.min.css" integrity="" crossorigin="anonymous" />
    <!--end::Third Party Plugin(Bootstrap Icons)-->
    <style>
        .register-box {
            margin-left: auto;
            margin-right: auto;
        }

        .alert {
            margin-bottom: 10px;
            max-height: 50px; /* Adjust this based on the height of your alert */
            overflow: hidden;
            transition: height 0.3s ease-in-out;
        }

        .text-dark {
            text-decoration: underline;
        }

        .text-danger {
            font-size: 0.875rem;
            color: #dc3545;
        }

        .auto-style1 {
            width: 413px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 0.5rem;
        }

        .auto-style2 {
            --bs-card-spacer-y: 1rem;
            --bs-card-spacer-x: 1rem;
            --bs-card-title-spacer-y: 0.5rem;
            --bs-card-border-width: var(--bs-border-width);
            --bs-card-border-color: var(--bs-border-color-translucent);
            --bs-card-border-radius: var(--bs-border-radius);
            --bs-card-box-shadow;
            --bs-card-inner-border-radius: calc(var(--bs-border-radius) - (var(--bs-border-width)));
            --bs-card-cap-padding-y: 0.5rem;
            --bs-card-cap-padding-x: 1rem;
            --bs-card-cap-bg: rgba(var(--bs-body-color-rgb), 0.03);
            --bs-card-cap-color;
            --bs-card-height;
            --bs-card-color;
            --bs-card-bg: var(--bs-body-bg);
            --bs-card-img-overlay-padding: 1rem;
            --bs-card-group-margin: 0.75rem;
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            height: var(--bs-card-height);
            color: var(--bs-body-color);
            word-wrap: break-word;
            background-clip: border-box;
            border-radius: .25rem;
            box-shadow: 0 0 1px rgba(var(--bs-body-color-rgb), 0.125), 0 1px 3px rgba(var(--bs-body-color-rgb), 0.2);
            -ms-flex-direction: column;
            left: 0px;
            top: 0px;
            width: 404px;
            background-color: #fff;
        }
    </style>
</head>

<body class="register-page bg-body-secondary">

    <form id="form1" runat="server" method="post">
        <div class="auto-style1">
            <div class="register-logo">
                <a href="../index2.html">
                    <img src="img/JLR_EMERIC-LOGO.png" alt="AdminLTE Logo" class="brand-image opacity-75 shadow" />
                </a>
            </div>

            <div class="auto-style2">
                <div class="card-body register-card-body">
              
                    <p class="register-box-msg">Register a new membership</p>

                

                
                    <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="TxtName" ErrorMessage="Fill Your Name" ForeColor="Red" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" class="form-control" placeholder="Full Name" ID="TxtName" autocomplete="off" AutoCompleteType="Disabled" required="true"></asp:TextBox>
                        <div class="input-group-text"><span class="bi bi-person"></span></div>
                    </div>
                  
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Fill Your Email" ForeColor="Red" Display="Dynamic" CssClass="text-danger" Font-Size="Small"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TxtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Enter a valid email address" ForeColor="Red" Display="Dynamic" CssClass="text-danger" Font-Size="Small"></asp:RegularExpressionValidator>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" class="form-control" placeholder="Email" ID="TxtEmail" AutoCompleteType="Disabled" type="email" required></asp:TextBox>
                        <div class="input-group-text"><span class="bi bi-envelope"></span></div>
                    </div>
                   
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TxtPassword" ErrorMessage="Fill Your Password" ForeColor="Red" Display="Dynamic" CssClass="text-danger" Font-Size="Small"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="TxtPassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" ErrorMessage="Password must contain at least 8 characters, including an uppercase letter, a lowercase letter, a number, and a special character." ForeColor="Red" Display="Dynamic" CssClass="text-danger" Font-Size="Small"></asp:RegularExpressionValidator>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" class="form-control" placeholder="Password" ID="TxtPassword" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                        <div class="input-group-text"><span class="bi bi-lock-fill"></span></div>
                    </div>
                    <br />
                   
                    <div><span id="checkboxError" class="text-danger"></span></div>
                    <div class="row">
                        <div class="col-8">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                <label class="form-check-label" for="flexCheckDefault">
                                    I agree to the <a href="#" class="text-dark">terms</a>
                                </label>
                            </div>

                        </div>


                       
                        <div class="col-4">
                            <div class="d-grid gap-2">
                                <asp:Button ID="BtnSubmit" runat="server" Text="Sign In" class="btn btn-dark" OnClick="BtnSubmit_Click" />
                            </div>
                        </div>
                    </div>


                    <div class="social-auth-links text-center mb-3 d-grid gap-2">
                        <p>- OR -</p>
                        <a href="#" class="btn btn-dark"><i class="bi bi-facebook me-2"></i>Sign in using Facebook</a>
                        <a href="#" class="btn btn-danger"><i class="bi bi-google me-2"></i>Sign in using Google+</a>
                    </div>

                    <p class="mb-0">
                        <a href="Login.aspx" class="text-center text-dark">I already have a membership</a>
                    </p>

                </div>

            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/browser/overlayscrollbars.browser.es6.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="js/adminlte.js"></script>

        <script>

            const SELECTOR_SIDEBAR_WRAPPER = ".sidebar-wrapper";
            const Default = {
                scrollbarTheme: "os-theme-light",
                scrollbarAutoHide: "leave",
                scrollbarClickScroll: true,
            };
            document.addEventListener("DOMContentLoaded", function () {
                const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);
                if (
                    sidebarWrapper &&
                    typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== "undefined"
                ) {
                    OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
                        scrollbars: {
                            theme: Default.scrollbarTheme,
                            autoHide: Default.scrollbarAutoHide,
                            clickScroll: Default.scrollbarClickScroll,
                        },
                    });
                }
            });

            document.addEventListener("DOMContentLoaded", function () {

                const checkbox = document.getElementById("flexCheckDefault");


                const checkboxError = document.getElementById("checkboxError");


                function validateCheckbox() {
                    if (!checkbox.checked) {
                        checkboxError.textContent = "* You must agree to the terms.";
                        return false;
                    } else {
                        checkboxError.textContent = "";
                        return true;
                    }
                }

                checkbox.addEventListener("change", validateCheckbox);

                const form = document.getElementById("form1");
                form.addEventListener("submit", function (event) {
                    let isValid = true;


                    if (!validateCheckbox()) {
                        isValid = false;
                    }

                    if (!isValid) {
                        event.preventDefault();
                    }
                });
            });




        </script>
    </form>
</body>
</html>
