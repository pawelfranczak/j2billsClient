<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/j2billsClient/account/">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-grin-beam-sweat"></i>
        </div>
        <div class="sidebar-brand-text mx-3">j2bills<sup>2.0</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="/j2billsClient/journal/create">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Nowy wpis</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        j2bills
      </div>
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Dziennik</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Dziennik:</h6>
            <a class="collapse-item" href="/j2billsClient/journal/create">Nowy wpis</a>
            <a class="collapse-item" href="/j2billsClient/journal/createMovement">Przelew</a>
            <a class="collapse-item" href="/j2billsClient/journal/1">Historia</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Konta</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Konta:</h6>
            <a class="collapse-item" href="/j2billsClient/account/">Pokaż wszystkie</a>
            <a class="collapse-item" href="/j2billsClient/account/create/">Nowe konto</a>
            <a class="collapse-item" href="/j2billsClient/account/edit/">Edytuj konto</a>
            <a class="collapse-item" href="/j2billsClient/account/delete/">Usuń konto</a>
          </div>
        </div>
      </li>
      
      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->