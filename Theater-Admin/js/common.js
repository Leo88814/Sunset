const common = {
  template: `<div class="sidebar d-flex flex-column flex-shrink-0 p-3">
    <h2 class="text-center text-white mb-4">管理系統</h2>
    <ul class="nav nav-pills flex-column mb-auto">
      <!-- 維護會員系統 -->
      <li class="nav-item">
        <a
          class="nav-link text-white"
          data-bs-toggle="collapse"
          href="#collapseMember"
          role="button"
          aria-expanded="false"
          aria-controls="collapseMember"
        >
          維護會員系統
        </a>
        <div class="collapse" id="collapseMember">
          <ul class="nav flex-column ms-3">
            <li>
              <a href="adminCancelMember.html" class="nav-link text-white"
                >註銷會員</a
              >
            </li>
            <li>
              <a
                href="adminStoredValueTransaction.html"
                class="nav-link text-white"
                >維護儲值支付系統</a
              >
            </li>
          </ul>
        </div>
      </li>
      <!-- 電影詳情頁面 -->
      <li>
        <a
          class="nav-link text-white"
          data-bs-toggle="collapse"
          href="#collapseMovie"
          role="button"
          aria-expanded="false"
          aria-controls="collapseMovie"
        >
          電影清單頁面
        </a>
        <div class="collapse" id="collapseMovie">
          <ul class="nav flex-column ms-3">
            <li>
              <a href="adminMovies.html" class="nav-link text-white"
                >電影清單</a
              >
            </li>
          </ul>
        </div>
      </li>
      <!-- 購票訂位系統 -->
      <li>
        <a
          class="nav-link text-white"
          data-bs-toggle="collapse"
          href="#collapseBooking"
          role="button"
          aria-expanded="false"
          aria-controls="collapseBooking"
        >
          購票訂位系統
        </a>
        <div class="collapse" id="collapseBooking">
          <ul class="nav flex-column ms-3">
            <li>
              <a href="adminTheaterManagement.html" class="nav-link text-white">影廳管理</a>
            </li>
            <li>
              <a href="adminShowtimeManagement.html" class="nav-link text-white">場次管理</a>
            </li>
            <li>
              <a href="adminSeatManagement.html" class="nav-link text-white">座位管理</a>
            </li>
            <li>
              <a href="adminOrderManagement.html" class="nav-link text-white">訂單管理</a>
            </li>
          </ul>
        </div>
      </li>
      <!-- 客服Q&A -->
      <li>
        <a
          class="nav-link text-white"
          data-bs-toggle="collapse"
          href="#collapseQA"
          role="button"
          aria-expanded="false"
          aria-controls="collapseQA"
        >
          客服Q&A
        </a>
        <div class="collapse" id="collapseQA">
          <ul class="nav flex-column ms-3">
            <li>
              <a href="adminAddQ&A.html" class="nav-link text-white"
                >新增Q&A</a
              >
            </li>
            <li>
              <a href="adminEditQ&A.html" class="nav-link text-white"
                >編輯Q&A</a
              >
            </li>
          </ul>
        </div>
      </li>
      <!-- 登出 -->
      <li>
        <a href="login.html" class="nav-link text-white">登出</a>
      </li>
    </ul>
  </div>
`,
};

const header = {
  template: `<div class="header ">
  <div class="container-fluid d-flex justify-content-between"> <!-- 添加 d-flex 和 justify-content-between 类 -->
  <h1 class="text-center ">Sunset影城管理系統</h1>
    <img src="logo.png" alt="Logo" class="me-3"/>
  </div>
</div>
`,
};
