const HeaderComponent = {
  template: `
    <header>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="Main.html" @click="goToHome">Sunset</a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  電影列表
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="Movie-Blockbuster.html">強檔熱映</a></li>
                  <li><a class="dropdown-item" href="Movie-ComingSoon.html">即將上映</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  影城介紹
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="Theater-SpecialEquipment.html">品牌理念</a></li>
                  <li><a class="dropdown-item" href="Theater-Info.html">影城位置</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  News
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">影城公告</a></li>
                  <li><a class="dropdown-item" href="#">影城活動</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="Support-QA.HTML" class="nav-link text-light">常見問題</a>
              </li>
            </ul>
            <div class="contain-flex align-items-center text-end ">
              <div class="login-container me-3">
                <div v-if="!isLoggedIn" class="nav-item h-100">
                  <a
                    href="User-Login.html"
                    class="nav-link text-light d-flex align-items-center justify-content-center h-100"
                    >
                    <img
                      src="/images/arrow-right-to-bracket-solid.png"
                      alt="Login"
                      class="login-icon"
                    />
                  </a>
                </div>
                <div v-else class="nav-item dropdown h-100">
                  <a
                    href="#"
                    class="nav-link d-flex align-items-center justify-content-center h-100"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                  >
                    <img
                      src="/images/circle-user-regular.jpg"
                      alt="User Avatar"
                      class="login-icon"
                    />
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="User-Profile.html">變更資料</a></li>
                    <li><a class="dropdown-item" href="User-ChangePassword.html">變更密碼</a></li>
                    <li><a class="dropdown-item" href="User-Ticket.html">票夾</a></li>
                    <li><a class="dropdown-item" href="User-History.html">歷史訂單</a></li>
                    <li><a class="dropdown-item" href="User-Charge.html">儲值資訊</a></li>
                    <li>
                      <a class="dropdown-item" href="#" @click="logout">登出</a>
                    </li>
                  </ul>
                </div>
              </div>
              <a href="Booking-ChoiceMovies.html" class="btn btn-warning ticketBtn">立即購票</a>
            </div>
          </div>
        </div>
      </nav>
    </header>
  `,
  setup() {
    const isLoggedIn = ref(false);

    const goToHome = () => {
      console.log("Navigating to home page");
    };

    const login = () => {
      isLoggedIn.value = true;
      console.log("使用者已登入");
    };

    const logout = () => {
      isLoggedIn.value = false;
      console.log("使用者已登出");
    };

    const checkLoginStatus = () => {
      // 在实际应用中，这里应该检查用户的登入状态
      isLoggedIn.value = false;
    };

    Vue.onMounted(() => {
      checkLoginStatus();
    });

    return {
      isLoggedIn,
      goToHome,
      login,
      logout,
    };
  },
};
