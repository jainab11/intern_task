<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Templatelist.aspx.cs" Inherits="Newsletter.Templatelist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Template List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <style>
        /* Custom styles */
        .table th, .table td {
            vertical-align: middle;
        }

        .btn-custom {
            min-width: 90px;
        }

        .thumbnail-img {
            width: 50px;
            height: 50px;
        }

        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background-color: #343a40;
            padding-top: 20px;
        }

            .sidebar a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 10px 15px;
                font-size: 18px;
            }

                .sidebar a:hover {
                    background-color: #575757;
                }

        .content {
            margin-left: 250px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="d-flex">
            <!-- Sidebar -->
            <div class="sidebar">
                <h4 class="text-white text-center">Admin Panel</h4>
                <a href="#">Dashboard</a>
                <a href="#">Templates</a>
                <a href="#">Settings</a>
                <a href="#">Users</a>
            </div>

            <!-- Main Content -->
            <div class="content container-fluid">
                <h2 class="text-center mb-4">Template List</h2>

                <div class="table-responsive">
                    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="TemplateID"
                        CssClass="table table-bordered"
                        BorderStyle="None"
                        OnRowCommand="gv_RowCommand" OnPageIndexChanging="gv_PageIndexChanging" OnRowDeleting="gv_RowDeleting"
                        AllowPaging="True" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="TemplateID" HeaderText="ID" ItemStyle-Width="10%" />
                            <asp:TemplateField HeaderText="Thumbnail" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:HyperLink ID="lnkThumbnail" runat="server"
                                        NavigateUrl='<%# "~/Template.aspx?TemplateID=" + Eval("TemplateID") %>'>
                                        <asp:Image ID="imgThumbnail" runat="server"
                                            ImageUrl='<%# Eval("Thumbnail") == DBNull.Value || string.IsNullOrEmpty(Eval("Thumbnail").ToString()) ? "~/img/JLR_EMERIC-LOGO.png" : Eval("Thumbnail") %>'
                                            CssClass="thumbnail-img" />
                                    </asp:HyperLink>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LayoutName" HeaderText="Layout Name" ItemStyle-Width="25%" />
                            <asp:BoundField DataField="EmailTitle" HeaderText="Email Title" ItemStyle-Width="30%" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:dd-MM-yyyy}" ItemStyle-Width="15%" />
                            <asp:BoundField DataField="ModifyDate" HeaderText="Modified Date" DataFormatString="{0:dd-MM-yyyy}" ItemStyle-Width="15%" />

                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="15%">
                                <ItemTemplate>
                                    <asp:Button runat="server" Text="Copy" CommandName="Copy" CommandArgument='<%# Eval("TemplateID") %>'
                                        OnClientClick="return confirm('Are you sure you want to copy this item?');"
                                        CssClass="btn btn-sm btn-primary btn-custom mb-2" />
                                    <asp:Button runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("TemplateID") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this item?');"
                                        CssClass="btn btn-sm btn-danger btn-custom mb-2" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Mode="NextPreviousFirstLast" Position="Bottom" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
