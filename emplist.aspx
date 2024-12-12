<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emplist.aspx.cs" Inherits="Newsletter.emplist" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee List</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .badge-active { background-color: #28a745; color: white; }
        .badge-inactive { background-color: #dc3545; color: white; }
        .badge-on-leave { background-color: #ffc107; color: black; }
        .table-actions button { margin-right: 5px; }
        .form-control, .form-select { max-width: 300px; display: inline-block; }   
      
    </style>
    <script>
        function showOptions(optionId) {
            document.querySelectorAll('.filter-options').forEach(option => option.classList.add('d-none'));
            document.getElementById(optionId).classList.remove('d-none');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5">
          
             <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Employee List</h2>
                <asp:Button ID="txtAddEmp" runat="server" Text="+ Add Employee" CssClass="btn btn-primary" OnClick="txtAddEmp_Click" />   
            </div>
            
               <div class="mb-4 row">
                    
                <div class="col-md-4">
                    <asp:TextBox ID="txtsearchh" runat="server" class="form-control" placeholder="Search by name, email, country..."></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btsearch" runat="server" Text="Search" OnClick="btsearch_Click" CssClass="btn btn-primary w-100" />
                </div>
                
                <div class="col-md-2">
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filterModal">
                Filter
            </button>  
                     <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="filterModalLabel">Filter Options</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="btn-group mb-3" role="group">
                                <button type="button" class="btn btn-secondary" onclick="showOptions('departmentOptions')">Department</button>
                                <button type="button" class="btn btn-secondary" onclick="showOptions('designationOptions')">Designation</button>
                                <button type="button" class="btn btn-secondary" onclick="showOptions('locationOptions')">Location</button>
                                <button type="button" class="btn btn-secondary" onclick="showOptions('regionOptions')">Region</button>
                                <button type="button" class="btn btn-secondary" onclick="showOptions('countryOptions')">Country</button>
                            </div>
                            <div id="departmentOptions" class="filter-options d-none">
                                <h6>Department</h6>
                                <asp:Repeater ID="rptDepartment" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkDepartment" runat="server" Text='<%# Eval("DEPARTMENT") %>' Value='<%# Eval("DEPARTMENT") %>' />                                         
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="designationOptions" class="filter-options d-none">
                                <h6>Designation</h6>
                                <asp:Repeater ID="rptDesignation" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkDesignation" runat="server" Text='<%# Eval("DESIGNATION") %>' Value='<%# Eval("DESIGNATION") %>' />
                                              </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="locationOptions" class="filter-options d-none">
                                <h6>Location</h6>
                                <asp:Repeater ID="rptLocation" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                             <asp:CheckBox ID="chkLocation" runat="server" Text='<%# Eval("LOCATION") %>' Value='<%# Eval("LOCATION") %>' />
                                               </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="regionOptions" class="filter-options d-none">
                                <h6>Region</h6>
                                <asp:Repeater ID="rptRegion" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkRegion" runat="server" Text='<%# Eval("REGION") %>' Value='<%# Eval("REGION") %>' />                                         
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="countryOptions" class="filter-options d-none">
                                <h6>Country</h6>
                                <asp:Repeater ID="rptCountry" runat="server">
                                    <ItemTemplate>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkCountry" runat="server" Text='<%# Eval("COUNTRY") %>' Value='<%# Eval("COUNTRY") %>' />                               
                                           </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <asp:Button ID="btFilters" runat="server" Text="Apply Filters" class="btn btn-primary" OnClick="btFilters_Click" />
                        </div>
                    </div>
                </div>
            </div>               
                </div>
            </div>
            <asp:LinkButton ID="btDeleteAlll" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete this record?');" OnClick="btDeleteAlll_Click">
    <i class="bi bi-trash"></i>
</asp:LinkButton>
           <asp:GridView ID="gvEmployees" runat="server" DataKeyNames="EMP_ID" ShowHeader="true" AutoGenerateColumns="False" 
    CssClass="table table-striped table-hover" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvEmployees_PageIndexChanging"> <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox ID="ChkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="ChkHeader_CheckedChanged" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="ChkEmpty" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EMP_ID" HeaderText="ID" SortExpression="EMP_ID" />
                    <asp:BoundField DataField="EMP_NAME" HeaderText="Employee Name" SortExpression="EMP_NAME" />
                    <asp:BoundField DataField="EMP_EMAILID" HeaderText="Email Id" SortExpression="EMP_EMAILID" />
                    <asp:BoundField DataField="DEPARTMENT" HeaderText="Department" SortExpression="DEPARTMENT" />
                    <asp:BoundField DataField="DESIGNATION" HeaderText="Designation" SortExpression="DESIGNATION" />
                    <asp:BoundField DataField="REGION" HeaderText="Region" SortExpression="Region" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="Country" SortExpression="COUNTRY" />
                    <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="table-actions">
                                <asp:Button ID="btEdit" runat="server" Text="Edit" OnClick="btEdit_Click1" CommandArgument='<%# Eval("EMP_ID") %>' />

                                <asp:LinkButton ID="btDelete" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClick="btDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                                    <i class="bi bi-trash"></i>
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>   
                </Columns>  
               <PagerSettings Mode="Numeric" Position="Bottom" />
               <PagerStyle HorizontalAlign="Center" />               
            </asp:GridView> 
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>