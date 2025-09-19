// 移动端导航菜单切换
const hamburger = document.getElementById('hamburger');
const navMenu = document.getElementById('nav-menu');

hamburger.addEventListener('click', () => {
    hamburger.classList.toggle('active');
    navMenu.classList.toggle('active');
});

// 点击导航链接时关闭移动端菜单
document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', () => {
        hamburger.classList.remove('active');
        navMenu.classList.remove('active');
    });
});

// 滚动时导航栏效果
window.addEventListener('scroll', () => {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 100) {
        navbar.style.background = 'rgba(255, 255, 255, 0.98)';
        navbar.style.boxShadow = '0 2px 25px rgba(0, 0, 0, 0.15)';
    } else {
        navbar.style.background = 'rgba(255, 255, 255, 0.95)';
        navbar.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.1)';
    }
});

// 平滑滚动到锚点
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            const offsetTop = target.offsetTop - 80; // 考虑导航栏高度
            window.scrollTo({
                top: offsetTop,
                behavior: 'smooth'
            });
        }
    });
});

// 页面加载动画
window.addEventListener('load', () => {
    // 添加页面加载完成的动画效果
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';
    
    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});

// 滚动动画观察器
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// 观察所有需要动画的元素
document.addEventListener('DOMContentLoaded', () => {
    const animateElements = document.querySelectorAll('.info-card, .service-card, .contact-card');
    
    animateElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
});

// 返回顶部按钮
const backToTopButton = document.createElement('button');
backToTopButton.innerHTML = '<i class="fas fa-arrow-up"></i>';
backToTopButton.classList.add('back-to-top');
backToTopButton.style.cssText = `
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 50px;
    height: 50px;
    background: #3498db;
    color: white;
    border: none;
    border-radius: 50%;
    cursor: pointer;
    display: none;
    z-index: 1000;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
`;

document.body.appendChild(backToTopButton);

// 滚动时显示/隐藏返回顶部按钮
window.addEventListener('scroll', () => {
    if (window.scrollY > 300) {
        backToTopButton.style.display = 'block';
    } else {
        backToTopButton.style.display = 'none';
    }
});

// 点击返回顶部
backToTopButton.addEventListener('click', () => {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});

// 鼠标悬停效果
backToTopButton.addEventListener('mouseover', () => {
    backToTopButton.style.background = '#2980b9';
    backToTopButton.style.transform = 'scale(1.1)';
});

backToTopButton.addEventListener('mouseout', () => {
    backToTopButton.style.background = '#3498db';
    backToTopButton.style.transform = 'scale(1)';
});

// 防止表单自动提交（如果后续添加表单）
document.addEventListener('submit', (e) => {
    // 可以在这里添加表单验证逻辑
});

// 服务详情数据
const serviceDetails = {
    software: {
        title: '软件开发',
        content: `
            <div class="service-detail">
                <h3>🚀 核心服务</h3>
                <ul>
                    <li>Web应用开发 - 响应式网站、后台管理系统</li>
                    <li>移动应用开发 - iOS/Android原生应用、混合应用</li>
                    <li>桌面软件开发 - Windows/Mac/Linux跨平台应用</li>
                    <li>微信小程序/支付宝小程序开发</li>
                    <li>API接口开发与集成</li>
                </ul>
                
                <h3>💡 技术特色</h3>
                <div class="service-features">
                    <div class="feature-item">
                        <div class="feature-icon">⚡</div>
                        <div class="feature-title">高性能</div>
                        <div class="feature-desc">优化算法，提升系统响应速度</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🔒</div>
                        <div class="feature-title">安全可靠</div>
                        <div class="feature-desc">多层安全防护，数据加密传输</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">📱</div>
                        <div class="feature-title">跨平台</div>
                        <div class="feature-desc">一套代码，多端运行</div>
                    </div>
                </div>
                
                <h3>🎯 适用场景</h3>
                <ul>
                    <li>企业管理系统 - ERP、CRM、OA系统</li>
                    <li>电商平台 - 在线商城、支付系统</li>
                    <li>社交应用 - 聊天工具、社区平台</li>
                    <li>工具软件 - 效率工具、专业软件</li>
                </ul>
            </div>
        `
    },
    cloud: {
        title: '云平台业务外包',
        content: `
            <div class="service-detail">
                <h3>☁️ 云服务能力</h3>
                <ul>
                    <li>云基础设施管理 - 服务器部署、监控维护</li>
                    <li>云原生应用开发 - 容器化、微服务架构</li>
                    <li>数据迁移与备份 - 本地到云端数据迁移</li>
                    <li>云安全防护 - 防火墙、入侵检测</li>
                    <li>自动化运维 - CI/CD、DevOps流程</li>
                </ul>
                
                <h3>🌟 平台优势</h3>
                <div class="service-features">
                    <div class="feature-item">
                        <div class="feature-icon">🌐</div>
                        <div class="feature-title">全球部署</div>
                        <div class="feature-desc">多区域节点，就近访问</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">📈</div>
                        <div class="feature-title">弹性扩展</div>
                        <div class="feature-desc">按需扩容，成本可控</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🔧</div>
                        <div class="feature-title">运维托管</div>
                        <div class="feature-desc">7x24小时专业运维</div>
                    </div>
                </div>
            </div>
        `
    },
    network: {
        title: '通信网络设备',
        content: `
            <div class="service-detail">
                <h3>📡 设备类型</h3>
                <ul>
                    <li>路由器设备 - 企业级、工业级路由器</li>
                    <li>交换机设备 - 千兆、万兆交换机</li>
                    <li>无线设备 - WiFi6路由器、无线AP</li>
                    <li>安全设备 - 防火墙、上网行为管理</li>
                    <li>监控设备 - 网络摄像头、NVR录像机</li>
                </ul>
                
                <h3>🔧 解决方案</h3>
                <div class="service-features">
                    <div class="feature-item">
                        <div class="feature-icon">🏢</div>
                        <div class="feature-title">企业网络</div>
                        <div class="feature-desc">办公网络建设与优化</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🏭</div>
                        <div class="feature-title">工业网络</div>
                        <div class="feature-desc">工厂自动化网络方案</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🛡️</div>
                        <div class="feature-title">网络安全</div>
                        <div class="feature-desc">全方位安全防护体系</div>
                    </div>
                </div>
            </div>
        `
    },
    data: {
        title: '数据处理存储',
        content: `
            <div class="service-detail">
                <h3>💾 数据服务</h3>
                <ul>
                    <li>大数据处理 - 海量数据清洗、分析</li>
                    <li>数据仓库建设 - 数据建模、ETL流程</li>
                    <li>数据可视化 - 报表设计、仪表盘</li>
                    <li>数据备份恢复 - 定时备份、灾难恢复</li>
                    <li>数据安全加密 - 敏感数据保护</li>
                </ul>
                
                <h3>📊 技术架构</h3>
                <div class="service-features">
                    <div class="feature-item">
                        <div class="feature-icon">⚡</div>
                        <div class="feature-title">实时处理</div>
                        <div class="feature-desc">毫秒级数据响应</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🔄</div>
                        <div class="feature-title">分布式存储</div>
                        <div class="feature-desc">多副本冗余保护</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">📈</div>
                        <div class="feature-title">智能分析</div>
                        <div class="feature-desc">AI驱动的数据洞察</div>
                    </div>
                </div>
            </div>
        `
    },
    smart: {
        title: '智能控制系统',
        content: `
            <div class="service-detail">
                <h3>🤖 智能化方案</h3>
                <ul>
                    <li>工业自动化控制 - PLC编程、SCADA系统</li>
                    <li>智能家居系统 - 照明、安防、环境控制</li>
                    <li>楼宇自动化 - 空调、电梯、消防联动</li>
                    <li>机器视觉检测 - 质量检测、缺陷识别</li>
                    <li>IoT物联网平台 - 设备接入、数据采集</li>
                </ul>
                
                <h3>🎯 应用领域</h3>
                <div class="service-features">
                    <div class="feature-item">
                        <div class="feature-icon">🏭</div>
                        <div class="feature-title">制造业</div>
                        <div class="feature-desc">生产线自动化改造</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🏠</div>
                        <div class="feature-title">智慧建筑</div>
                        <div class="feature-desc">绿色节能管理系统</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🚗</div>
                        <div class="feature-title">交通运输</div>
                        <div class="feature-desc">智能调度与监控</div>
                    </div>
                </div>
            </div>
        `
    },
    game: {
        title: '动漫游戏开发',
        content: `
            <div class="service-detail">
                <h3>🎮 游戏类型</h3>
                <ul>
                    <li>手机游戏 - 休闲游戏、RPG、策略游戏</li>
                    <li>网页游戏 - H5游戏、小游戏</li>
                    <li>VR/AR游戏 - 沉浸式体验游戏</li>
                    <li>教育游戏 - 寓教于乐的学习游戏</li>
                    <li>动漫制作 - 2D/3D动画、角色设计</li>
                </ul>
                
                <h3>🎨 创意服务</h3>
                <div class="service-features">
                    <div class="feature-item">
                        <div class="feature-icon">🎨</div>
                        <div class="feature-title">美术设计</div>
                        <div class="feature-desc">原画设计、UI界面</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🎵</div>
                        <div class="feature-title">音效配乐</div>
                        <div class="feature-desc">背景音乐、音效制作</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">📱</div>
                        <div class="feature-title">多平台发布</div>
                        <div class="feature-desc">iOS、Android同步上线</div>
                    </div>
                </div>
            </div>
        `
    },
    consulting: {
        title: '技术咨询服务',
        content: `
            <div class="service-detail">
                <h3>💼 咨询范围</h3>
                <ul>
                    <li>技术选型咨询 - 架构设计、技术栈选择</li>
                    <li>数字化转型 - 业务流程优化、系统规划</li>
                    <li>技术培训 - 团队技能提升、最佳实践</li>
                    <li>项目管理 - 敏捷开发、质量控制</li>
                    <li>安全评估 - 系统安全审计、风险评估</li>
                </ul>
                
                <h3>👥 专家团队</h3>
                <div class="service-features">
                    <div class="feature-item">
                        <div class="feature-icon">🎓</div>
                        <div class="feature-title">资深专家</div>
                        <div class="feature-desc">10年+行业经验</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🏆</div>
                        <div class="feature-title">认证资质</div>
                        <div class="feature-desc">多项国际技术认证</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🤝</div>
                        <div class="feature-title">贴心服务</div>
                        <div class="feature-desc">一对一专业指导</div>
                    </div>
                </div>
            </div>
        `
    },
    business: {
        title: '商务代理服务',
        content: `
            <div class="service-detail">
                <h3>🤝 代理服务</h3>
                <ul>
                    <li>公司注册代办 - 工商注册、税务登记</li>
                    <li>资质申请代理 - 软件著作权、高新认定</li>
                    <li>商标专利申请 - 知识产权保护</li>
                    <li>财务代理记账 - 税务申报、财务咨询</li>
                    <li>市场推广策划 - 品牌宣传、活动策划</li>
                </ul>
                
                <h3>📈 营销服务</h3>
                <div class="service-features">
                    <div class="feature-item">
                        <div class="feature-icon">📊</div>
                        <div class="feature-title">市场分析</div>
                        <div class="feature-desc">行业调研、竞品分析</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">🎯</div>
                        <div class="feature-title">精准营销</div>
                        <div class="feature-desc">客户画像、定向推广</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">📱</div>
                        <div class="feature-title">数字营销</div>
                        <div class="feature-desc">新媒体运营、SEO优化</div>
                    </div>
                </div>
            </div>
        `
    }
};

// 打开服务详情
function openServiceDetail(serviceType) {
    const modal = document.getElementById('serviceModal');
    const modalTitle = document.getElementById('modalTitle');
    const modalContent = document.getElementById('modalContent');
    
    if (serviceDetails[serviceType]) {
        modalTitle.textContent = serviceDetails[serviceType].title;
        modalContent.innerHTML = serviceDetails[serviceType].content;
        modal.style.display = 'block';
        document.body.style.overflow = 'hidden';
    }
}

// 关闭服务详情
function closeServiceDetail() {
    const modal = document.getElementById('serviceModal');
    modal.style.display = 'none';
    document.body.style.overflow = 'auto';
}

// 点击模态框外部关闭
window.onclick = function(event) {
    const modal = document.getElementById('serviceModal');
    if (event.target === modal) {
        closeServiceDetail();
    }
}

// 打开地图
function openMap() {
    const address = '深圳市龙岗区布吉街道龙岭社区吉华路215号301';
    const encodedAddress = encodeURIComponent(address);
    
    // 尝试多个地图平台
    const mapUrls = [
        `https://uri.amap.com/marker?position=114.1155,22.6040&name=深圳智核创享科技有限公司&src=智核创享官网&coordinate=gaode&callnative=0`,
        `https://map.baidu.com/search/${encodedAddress}`,
        `https://www.google.com/maps/search/${encodedAddress}`
    ];
    
    // 优先使用高德地图
    window.open(mapUrls[0], '_blank');
}

// 图片懒加载（如果后续添加图片）
if ('IntersectionObserver' in window) {
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });

    document.querySelectorAll('img[data-src]').forEach(img => {
        imageObserver.observe(img);
    });
}
