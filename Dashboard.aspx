<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Newsletter.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>AdminLTE 4 | Sidebar Mini</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="title" content="AdminLTE 4 | Sidebar Mini" />
    <meta name="author" content="ColorlibHQ" />
    <meta name="description" content="AdminLTE is a Free Bootstrap 5 Admin Dashboard, 30 example pages using Vanilla JS." />
    <meta name="keywords" content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard" />
    <link rel="stylesheet" href="css/jlr_fonts.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="stylesheet" href="css/adminlte.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/styles/overlayscrollbars.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.min.css" />
    <script src="js/adminlte.js"></script>
    <script src="js/adminlte.min.js"></script>
    <style>
        .child_menu a {
            text-decoration: none;
            color: white;
        }

        ul {
            list-style-type: none;
        }

        .child_menu {
            list-style: none;
            padding-left: 15px;
            margin-top: 10px;
            display: none;
        }

            .child_menu li {
                margin-bottom: 8px;
            }

                .child_menu li a {
                    color: #b3b3b3;
                    text-decoration: none;
                    font-size: 14px;
                }

                    .child_menu li a:hover {
                        color: #f4f4f4;
                    }


        .nav-link.active .nav-arrow {
            transform: rotate(90deg);
        }


        .child_menu.show {
            display: block;
            transition: all 0.3s ease-in-out;
        }

        /*body.nav-md ul.nav.child_menu li:before {
            background: #425668;
            bottom: auto;
            content: "";
            height: 8px;
            left: 23px;
            margin-top: 15px;
            position: absolute;
            right: auto;
            width: 8px;
            z-index: 1;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50%;
        }

        body.nav-md ul.nav.child_menu li:after {
            border-left: 1px solid #425668;
            bottom: 0;
            content: "";
            left: 27px;
            position: absolute;
            top: 0;
        }*/
    </style>
    <%--<style>
        /* Custom Styles */
        .sidebar-wrapper {
            padding-top: 0.5rem;
            padding-right: 0.5rem;
            padding-bottom: 0.5rem;
            padding-left: 0.5rem;
            scrollbar-color: var(--bs-secondary-bg) transparent;
            scrollbar-width: thin;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            width: 250px;
            background-color: #343a40;
            color: white;
            z-index: 1000;
        }

        /* Sidebar brand section (logo + text) */
        .sidebar-brand {
            display: flex;
            align-items: center;
            padding: 10px;
            background-color: #343a40;
            margin-bottom: 20px;
        }

        .sidebar-brand .brand-link {
            display: flex;
            align-items: center;
        }

        .sidebar-brand .brand-image {
            width: 40px;
            height: auto;
            margin-right: 10px;
        }

        .sidebar-brand .brand-text {
            font-size: 18px;
            color: white;
        }

        /* Menu Section */
        .sidebar-menu {
            padding-top: 20px;
        }
    </style>--%>
</head>
<%--<body class="nav-md">
    <form id="form1" runat="server">
        <div class="container body">
            <div class="main_container">
                <!-- Sidebar -->
                <aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
                    <div class="sidebar-wrapper" data-overlayscrollbars="host">
                        <!-- Sidebar brand (Logo and name) -->
                        <div class="sidebar-brand">
                            <a href="./index.html" class="brand-link">
                                <img src="assets/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image opacity-75 shadow">
                                <span class="brand-text fw-light" style="color: white; padding-left: 10px;">My Admin Dashboard</span>
                            </a>
                        </div>

                        <!-- Sidebar Menu (hidden by default, shown on click) -->
                        <nav class="mt-2">
                            <ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="menu" data-accordion="false">
                                <li class="nav-item">
                                    <a href="#" class="nav-link" onclick="toggleDropdown('emailAddresses')"><i class="nav-icon bi bi-speedometer"></i>
                                        <p>Email addresses <i class="fa fa-chevron-down float-end"></i></p>
                                    </a>
                                    <ul id="emailAddresses" class="child_menu" style="display: none;">
                                        <li><a href="#">Recipients list</a></li>
                                        <li><a href="#">Add recipient</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link" onclick="toggleDropdown('emailLayouts')"><i class="fa fa-desktop"></i>
                                        <p>Email layouts <i class="fa fa-chevron-down float-end"></i></p>
                                    </a>
                                    <ul id="emailLayouts" class="child_menu" style="display: none;">
                                        <li><a href="#">Templates list</a></li>
                                        <li><a href="#">Add new template</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link" onclick="toggleDropdown('yourCampaigns')"><i class="fa fa-table"></i>
                                        <p>Your campaigns <i class="fa fa-chevron-down float-end"></i></p>
                                    </a>
                                    <ul id="yourCampaigns" class="child_menu" style="display: none;">
                                        <li><a href="#">Prepare new campaign</a></li>
                                        <li><a href="#">Waiting list campaign</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </aside>

                <!-- Main Content (Right Column) -->
                <div class="right_col" style="margin-left: 250px; padding: 20px;">
                    <h2>Available templates</h2>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/browser/overlayscrollbars.browser.es6.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
        <script src="js/adminlte.js"></script>

        <script>
            function toggleSidebar() {
                document.querySelector('.sidebar-wrapper').classList.toggle('active');
            }

            function toggleDropdown(id) {
                var menu = document.getElementById(id);
                menu.style.display = (menu.style.display === 'none' || menu.style.display === '') ? 'block' : 'none';
            }
        </script>
    </form>
</body>--%>
<body class="layout-fixed sidebar-expand-lg sidebar-mini sidebar-collapse bg-body-tertiary">

    <div class="app-wrapper">

        <nav class="app-header navbar navbar-expand bg-body">

            <div class="container-fluid">

                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" data-lte-toggle="sidebar" href="#" role="button"><i class="bi bi-list"></i></a></li>
                    <li class="nav-item d-none d-md-block"><a href="#" class="nav-link">Home</a> </li>
                    <li class="nav-item d-none d-md-block"><a href="#" class="nav-link">Contact</a> </li>
                </ul>

                <ul class="navbar-nav ms-auto">

                    <li class="nav-item"><a class="nav-link" data-widget="navbar-search" href="#" role="button"><i class="bi bi-search"></i></a></li>

                    <li class="nav-item dropdown"><a class="nav-link" data-bs-toggle="dropdown" href="#"><i class="bi bi-chat-text"></i><span class="navbar-badge badge text-bg-danger">3</span> </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                            <a href="#" class="dropdown-item">
                                <!--begin::Message-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0">
                                        <img src="assets/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 rounded-circle me-3">
                                    </div>
                                    <div class="flex-grow-1">
                                        <h3 class="dropdown-item-title">Brad Diesel
                                            <span class="float-end fs-7 text-danger"><i class="bi bi-star-fill"></i></span>
                                        </h3>
                                        <p class="fs-7">Call me whenever you can...</p>
                                        <p class="fs-7 text-secondary">
                                            <i class="bi bi-clock-fill me-1"></i>4 Hours Ago
                                        </p>
                                    </div>
                                </div>
                                <!--end::Message-->
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <!--begin::Message-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0">
                                        <img src="assets/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 rounded-circle me-3">
                                    </div>
                                    <div class="flex-grow-1">
                                        <h3 class="dropdown-item-title">John Pierce
                                            <span class="float-end fs-7 text-secondary"><i class="bi bi-star-fill"></i></span>
                                        </h3>
                                        <p class="fs-7">I got your message bro</p>
                                        <p class="fs-7 text-secondary">
                                            <i class="bi bi-clock-fill me-1"></i>4 Hours Ago
                                        </p>
                                    </div>
                                </div>
                                <!--end::Message-->
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <!--begin::Message-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0">
                                        <img src="assets/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 rounded-circle me-3"/>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h3 class="dropdown-item-title">Nora Silvester
                                            <span class="float-end fs-7 text-warning"><i class="bi bi-star-fill"></i></span>
                                        </h3>
                                        <p class="fs-7">The subject goes here</p>
                                        <p class="fs-7 text-secondary">
                                            <i class="bi bi-clock-fill me-1"></i>4 Hours Ago
                                        </p>
                                    </div>
                                </div>
                                <!--end::Message-->
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                        </div>
                    </li>
                    <!--end::Messages Dropdown Menu-->
                    <!--begin::Notifications Dropdown Menu-->
                    <li class="nav-item dropdown"><a class="nav-link" data-bs-toggle="dropdown" href="#"><i class="bi bi-bell-fill"></i><span class="navbar-badge badge text-bg-warning">15</span> </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                            <span class="dropdown-item dropdown-header">15 Notifications</span>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item"><i class="bi bi-envelope me-2"></i>4 new messages
                                <span class="float-end text-secondary fs-7">3 mins</span> </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item"><i class="bi bi-people-fill me-2"></i>8 friend requests
                                <span class="float-end text-secondary fs-7">12 hours</span> </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item"><i class="bi bi-file-earmark-fill me-2"></i>3 new reports
                                <span class="float-end text-secondary fs-7">2 days</span> </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item dropdown-footer">See All Notifications
                            </a>
                        </div>
                    </li>
                    <!--end::Notifications Dropdown Menu-->
                    <!--begin::Fullscreen Toggle-->
                    <li class="nav-item"><a class="nav-link" href="#" data-lte-toggle="fullscreen"><i data-lte-icon="maximize" class="bi bi-arrows-fullscreen"></i><i data-lte-icon="minimize" class="bi bi-fullscreen-exit" style="display: none;"></i></a></li>
                    <!--end::Fullscreen Toggle-->
                    <!--begin::User Menu Dropdown-->
                    <li class="nav-item dropdown user-menu"><a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img src="assets/img/user2-160x160.jpg" class="user-image rounded-circle shadow" alt="User Image"/>
                        <span class="d-none d-md-inline">Alexander Pierce</span> </a>
                        <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                            <!--begin::User Image-->
                            <li class="user-header text-bg-primary">
                                <img src="assets/img/user2-160x160.jpg" class="rounded-circle shadow" alt="User Image"/>
                                <p>
                                    Alexander Pierce - Web Developer
                                    <small>Member since Nov. 2023</small>
                                </p>
                            </li>
                            <!--end::User Image-->
                            <!--begin::Menu Body-->
                            <li class="user-body">
                                <!--begin::Row-->
                                <div class="row">
                                    <div class="col-4 text-center"><a href="#">Followers</a> </div>
                                    <div class="col-4 text-center"><a href="#">Sales</a> </div>
                                    <div class="col-4 text-center"><a href="#">Friends</a> </div>
                                </div>
                                <!--end::Row-->
                            </li>
                            <!--end::Menu Body-->
                            <!--begin::Menu Footer-->
                            <li class="user-footer"><a href="#" class="btn btn-default btn-flat">Profile</a> <a href="#" class="btn btn-default btn-flat float-end">Sign out</a> </li>
                            <!--end::Menu Footer-->
                        </ul>
                    </li>
                    <!--end::User Menu Dropdown-->
                </ul>
                <!--end::End Navbar Links-->
            </div>
            <!--end::Container-->
        </nav>
        <!--end::Header-->
        <!--begin::Sidebar-->
        <aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
            <!--begin::Sidebar Brand-->
            <div class="sidebar-brand">
                <!--begin::Brand Link-->
                <a href="./index.html" class="brand-link">
                    <!--begin::Brand Image-->
                    <img src="assets/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image opacity-75 shadow">
                    <!--end::Brand Image-->
                    <!--begin::Brand Text-->
                    <span class="brand-text fw-light">AVL</span>
                    <!--end::Brand Text-->
                </a>
                <!--end::Brand Link-->
            </div>
            <!--end::Sidebar Brand-->
            <!--begin::Sidebar Wrapper-->
            <div class="sidebar-wrapper">
                <nav class="mt-2">
                    <!--begin::Sidebar Menu-->
                    <ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="menu" data-accordion="false">
                        <li class="nav-item" style="text-decoration: none;" >
                            
                            <a href="#" class="nav-link">

                                <i class="nav-icon bi bi-speedometer"></i>
                                <p>Dashboard <i class="nav-arrow bi bi-chevron-right"></i></p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="#" class="nav-link" onclick="toggleDropdown('emailAddresses')">
                                <i class="nav-icon bi bi-envelope"></i>
                                <p>Email addresses <i class="nav-arrow bi bi-chevron-right"></i></p>
                            </a>
                            <ul id="emailAddresses" class="child_menu" style="display: none;">
                                <li style="text-decoration: none;"><a href="#">&nbsp;&nbsp; Recipients list</a></li>
                                <li style="text-decoration: none;"><a href="#">&nbsp; &nbsp;Add recipient</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a href="#" class="nav-link" onclick="toggleDropdown('emailLayouts')">
                                <i class="nav-icon bi bi-palette"></i>
                                <p>Email layouts <i class="nav-arrow bi bi-chevron-right"></i></p>
                            </a>
                            <ul id="emailLayouts" class="child_menu" style="display: none;">
                                <li style="text-decoration: none;"><a href="#">&nbsp; &nbsp;Templates list</a></li>
                                <li style="text-decoration: none;"><a href="#">&nbsp; &nbsp;Add new template</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a href="#" class="nav-link" onclick="toggleDropdown('yourCampaigns')">
                                <i class="nav-icon bi bi-bullseye"></i>
                                <p>Your campaigns <i class="nav-arrow bi bi-chevron-right"></i></p>
                            </a>
                            <ul id="yourCampaigns" class="child_menu" style="display: none;">
                                <li style="text-decoration: none;"><a href="index.php?manage=campaign&amp;action=waiting">&nbsp; &nbsp;Prepare new campaign</a></li>
                                <li style="text-decoration: none;"><a href="index.php?manage=campaign&amp;action=waiting">&nbsp; &nbsp;Waiting list campaign</a></li>
                            </ul>
                        </li>
                    </ul>

                </nav>
            </div>
            <!--end::Sidebar Wrapper-->
        </aside>
        <!--end::Sidebar-->
        <!--begin::App Main-->
        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">Collapsed Sidebar</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-end">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Collapsed Sidebar
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!--end::Row-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::App Content Header-->
            <!--begin::App Content-->
            <div class="app-content">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-12">
                            <!-- Default box -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Title</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-lte-toggle="card-collapse" title="Collapse"><i data-lte-icon="expand" class="bi bi-plus-lg"></i><i data-lte-icon="collapse" class="bi bi-dash-lg"></i></button>
                                        <button type="button" class="btn btn-tool" data-lte-toggle="card-remove" title="Remove"><i class="bi bi-x-lg"></i></button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    Start creating your amazing application!
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">Footer</div>
                                <!-- /.card-footer-->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!--end::Row-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::App Content-->
        </main>
        <!--end::App Main-->
        <!--begin::Footer-->
        <footer class="app-footer">
            <!--begin::To the end-->
            <div class="float-end d-none d-sm-inline">Anything you want</div>
          
            <strong>Copyright &copy; 2014-2024&nbsp;
                <a href="https://adminlte.io" class="text-decoration-none">AdminLTE.io</a>.
            </strong>
            All rights reserved.
            
        </footer>
      
    </div>

    <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/browser/overlayscrollbars.browser.es6.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    <script src="js/adminlte.js"></script>

    <script>
        // Function to handle opening and closing of dropdowns
        function toggleDropdown(id) {
            // Close all dropdowns
            var allMenus = document.querySelectorAll('.child_menu');
            allMenus.forEach(function (menu) {
                if (menu.id !== id) {
                    menu.style.display = 'none'; // Close other menus
                }
            });

            // Toggle the clicked dropdown
            var currentMenu = document.getElementById(id);
            if (currentMenu.style.display === 'none' || currentMenu.style.display === '') {
                currentMenu.style.display = 'block'; // Open the selected dropdown
            } else {
                currentMenu.style.display = 'none'; // Close it if it's already open
            }
        }
</script>
   
    <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/browser/overlayscrollbars.browser.es6.min.js" integrity="" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="" crossorigin="anonymous"></script>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="" crossorigin="anonymous"></script>

    <script src="js/adminlte.js"></script>
    

    <script>  const SELECTOR_SIDEBAR_WRAPPER = ".sidebar-wrapper";
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
        });</script>

</body>
</html>
