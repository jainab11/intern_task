<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="Newsletter.Template" ValidateRequest="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Add New Templates</title>

    <script src="https://cdn.tiny.cloud/1/7abf894dc4t513v84wu4ddhoz6f0ky4lklvyiqc0b4npsccw/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="robots" content="noindex,nofollow" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" />
    <script src="https://cdn.tiny.cloud/1/7abf894dc4t513v84wu4ddhoz6f0ky4lklvyiqc0b4npsccw/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.tinyMCE.com/5/tinymce.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        /* Sidebar Styles */
        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #1abc9c;
        }

        .sidebar .logout-btn {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #e74c3c;
            border: none;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
        }

        .main-content {
            margin-left: 260px; /* Adjust based on sidebar width */
            padding: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .float-right {
            margin-left: auto;
        }

        .btn-xs {
            font-size: 12px;
            padding: 5px 10px;
        }

        .hidden {
            display: none !important;
        }
    </style>

    <script>
        // Function to initialize the TinyMCE editor
        function initializeEditor() {
            tinymce.init({
                selector: '#basicConf',
                width: '100%', // Ensure it spans the full width
                height: 800, // Set the height of the editor
                plugins: [
                    'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'preview', 'anchor', 'pagebreak',
                    'searchreplace', 'wordcount', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media',
                    'table', 'emoticons', 'help'
                ],
                toolbar: 'undo redo | styles | bold italic | alignleft aligncenter alignright alignjustify | ' +
                    'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
                    'forecolor backcolor emoticons | help',
                menubar: 'file edit view insert format tools table help',
                content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }',
            });
        }

        function destroyEditor() {
            if (tinymce.get('basicConf')) {
                tinymce.get('basicConf').remove();
            }
        }

        document.addEventListener('DOMContentLoaded', function () {

            initializeEditor();

            document.getElementById('disable_editor').addEventListener('click', function () {
                destroyEditor();
                document.getElementById('disable_editor').classList.add('hidden');
                document.getElementById('enable_editor').classList.remove('hidden');
            });

            document.getElementById('enable_editor').addEventListener('click', function () {
                initializeEditor();
                document.getElementById('enable_editor').classList.add('hidden');
                document.getElementById('disable_editor').classList.remove('hidden');
            });
        });
    </script>
</head>
<body class="nav-md">
    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center text-white">Email Templates</h3>
        <a href="#">Email Layout</a>
        <a href="#">Add New Template</a>
        <a href="#">Template Settings</a>
       <%--<asp:Button runat="server" ID="btnlogout" OnClick="btnlogout_Click" />--%>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <form runat="server">

            <div class="top_nav">
                <div class="nav_menu">
                    <nav style="display: flex; justify-content: space-between; align-items: center;">
                        <div class="nav toggle">
                            <a id="menu_toggle" style="margin-bottom: 10px; margin-top:2px"><i class="fa fa-bars"></i></a>
                        </div>
                        <div>
                            <asp:Button class="btn btn-dark btn-xs" Text="Sign Out" OnClick="btnSignOut_Click" ID="btnSignOut" runat="server" />
                        </div>
                    </nav>
                </div>
            </div>

            <div class="right_col" role="main">
                <div class="page-title">
                    <div class="title_left">
                        <h3>&nbsp;Layout Editing <small>(Add new layout)</small></h3>
                    </div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Add New Layout</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <div class="form-group">
                                    <label for="name">Layout Name*</label>
                                    <asp:TextBox type="text" class="form-control" ID="name" name="name" placeholder="Layout name" runat="server" required> </asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="subject">Email Title*</label>
                                    <asp:TextBox runat="server" type="text" class="form-control" ID="subject" name="subject" placeholder="Enter email title" required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="content_txt">
                                        HTML header <code>&lt;<input id="doctype" type="text" name="doctype" placeholder="!DOCTYPE here..." value="!DOCTYPE html" pattern="[^']*$">&gt;&lt;head&gt;...&lt;/head&gt;</code>
                                    </label>
                                </div>
                                <textarea runat="server" id="header_html" name="html_header" class="form-control">&lt;title&gt;Email Title&lt;/title&gt;</textarea>

                                <div class="form-group">
                                    <label for="basicConf">HTML Version</label>
                                    <label for="content_txt">
                                        <code>&lt;body<input id="body_attribs" type="text" name="body_attribs" placeholder="attribs here..." value="class=&quot;myClass&quot;" pattern="[^']*$">&gt;...&lt;/body&gt;</code>
                                    </label>
                                    <div style="margin-left: auto;">
                                        <a id="disable_editor" class="btn btn-primary btn-xs float-right">Disable Editor</a>
                                        <a id="enable_editor" class="btn btn-primary btn-xs float-right hidden">Enable Editor</a>
                                    </div>

                                    <textarea id="basicConf" name="content_html" runat="server"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="content_html">Available Template Variables</label>
                                    <p style="font-weight: normal">{RECIPIENT_NAME}, {RECIPIENT_EMAIL}, {UNSUBSCRIBE}, {BROWSER_VIEW}, {CAMPAIGN_NAME}, {SENDER_NAME}</p>
                                </div>

                                <div class="form-group">
                                    <label for="content_txt">Text Version</label>
                                    <textarea id="mailtxt" name="content_txt" class="form-control" runat="server"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="content_thumbnail"></label>
                                    <asp:FileUpload runat="server" ID="FileUpload1" />
                                    
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnsubmit" class="btn btn-primary pull-right" runat="server" OnClick="btnsubmit_Click" Text="Save" />
                                    <asp:Button ID="btnUpdate" CssClass="btn btn-primary pull-right" runat="server" OnClick="btnUpdate_Click" Visible="false"  Text="Update"/>
                                    <asp:Button ID="btncancel" class="btn btn-danger pull-right" runat="server" OnClick="btncancel_Click" Text="Cancel" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        // Handle the logout functionality (e.g., redirect to a logout page or clear session)
        function logout() {
            // Add your logout logic here, such as clearing the session or redirecting to a logout page
            window.location.href = '/logout';
        }
    </script>
</body>
</html>
