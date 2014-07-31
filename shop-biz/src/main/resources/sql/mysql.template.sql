--
-- Current Database: `igo`
--
DROP DATABASE IF EXISTS `shop`;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

GRANT ALL PRIVILEGES ON shop.* TO 'shop'@'localhost' IDENTIFIED BY 'shop';

USE `shop`;

CREATE TABLE xx_ad (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    begin_date DATETIME,
    content LONGTEXT,
    end_date DATETIME,
    path VARCHAR(255),
    title VARCHAR(255) NOT NULL,
    `type` INTEGER NOT NULL,
    url VARCHAR(255),
    ad_position BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_ad_position (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    description VARCHAR(255),
    height INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    template LONGTEXT NOT NULL,
    width INTEGER NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_admin (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    department VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    is_enabled BIT NOT NULL,
    is_locked BIT NOT NULL,
    locked_date DATETIME,
    login_date DATETIME,
    login_failure_count INTEGER NOT NULL,
    login_ip VARCHAR(255),
    name VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_supplier (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    email VARCHAR(255) NOT NULL,
    alipay VARCHAR(255),
    bank VARCHAR(255),
    account VARCHAR(255),
    is_enabled BIT NOT NULL,
    is_locked BIT NOT NULL,
    locked_date DATETIME,
    login_date DATETIME,
    login_failure_count INTEGER NOT NULL,
    login_ip VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_admin_role (
    admins BIGINT NOT NULL,
    roles BIGINT NOT NULL,
    PRIMARY KEY (admins , roles)
)  engine=innodb;

CREATE TABLE xx_area (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    full_name LONGTEXT NOT NULL,
    name VARCHAR(100) NOT NULL,
    tree_path VARCHAR(255) NOT NULL,
    parent BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_article (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    author VARCHAR(255),
    content LONGTEXT,
    hits BIGINT NOT NULL,
    is_publication BIT NOT NULL,
    is_top BIT NOT NULL,
    seo_description VARCHAR(255),
    seo_keywords VARCHAR(255),
    seo_title VARCHAR(255),
    title VARCHAR(255) NOT NULL,
    article_category BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_article_category (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    grade INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    seo_description VARCHAR(255),
    seo_keywords VARCHAR(255),
    seo_title VARCHAR(255),
    tree_path VARCHAR(255) NOT NULL,
    parent BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_article_tag (
    articles BIGINT NOT NULL,
    tags BIGINT NOT NULL,
    PRIMARY KEY (articles , tags)
)  engine=innodb;

CREATE TABLE xx_attribute (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    name VARCHAR(255) NOT NULL,
    property_index INTEGER NOT NULL,
    product_category BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_attribute_option (
    attribute BIGINT NOT NULL,
    options VARCHAR(255)
)  engine=innodb;

CREATE TABLE xx_brand (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    introduction LONGTEXT,
    logo VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    `type` INTEGER NOT NULL,
    url VARCHAR(255),
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_cart (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    cart_key VARCHAR(255) NOT NULL,
    member BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_cart_item (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    quantity INTEGER NOT NULL,
    cart BIGINT NOT NULL,
    product BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_consultation (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    content VARCHAR(255) NOT NULL,
    ip VARCHAR(255) NOT NULL,
    is_show BIT NOT NULL,
    for_consultation BIGINT,
    member BIGINT,
    product BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_coupon (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    begin_date DATETIME,
    end_date DATETIME,
    introduction LONGTEXT,
    is_enabled BIT NOT NULL,
    is_exchange BIT NOT NULL,
    maximum_price DECIMAL(21 , 6 ),
    maximum_quantity INTEGER,
    minimum_price DECIMAL(21 , 6 ),
    minimum_quantity INTEGER,
    name VARCHAR(255) NOT NULL,
    point BIGINT,
    prefix VARCHAR(255) NOT NULL,
    price_expression VARCHAR(255),
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_coupon_code (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    code VARCHAR(100) NOT NULL UNIQUE,
    is_used BIT NOT NULL,
    used_date DATETIME,
    coupon BIGINT NOT NULL,
    member BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_delivery_center (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    address VARCHAR(255) NOT NULL,
    area_name VARCHAR(255) NOT NULL,
    contact VARCHAR(255) NOT NULL,
    is_default BIT NOT NULL,
    memo VARCHAR(255),
    mobile VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    zip_code VARCHAR(255),
    area BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_delivery_corp (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    code VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255),
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_delivery_template (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    background VARCHAR(255),
    content LONGTEXT NOT NULL,
    height INTEGER NOT NULL,
    is_default BIT NOT NULL,
    memo VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    offsetx INTEGER NOT NULL,
    offsety INTEGER NOT NULL,
    width INTEGER NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_deposit (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    balance DECIMAL(21 , 6 ) NOT NULL,
    credit DECIMAL(21 , 6 ) NOT NULL,
    debit DECIMAL(21 , 6 ) NOT NULL,
    memo VARCHAR(255),
    operator VARCHAR(255),
    `type` INTEGER NOT NULL,
    member BIGINT NOT NULL,
    orders BIGINT,
    payment BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_friend_link (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    logo VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    `type` INTEGER NOT NULL,
    url VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_gift_item (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    quantity INTEGER NOT NULL,
    gift BIGINT NOT NULL,
    promotion BIGINT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (gift , promotion)
)  engine=innodb;

CREATE TABLE xx_goods (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_log (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    content LONGTEXT,
    ip VARCHAR(255) NOT NULL,
    operation VARCHAR(255) NOT NULL,
    operator VARCHAR(255),
    parameter LONGTEXT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_member (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    address VARCHAR(255),
    amount DECIMAL(27 , 12 ) NOT NULL,
    attribute_value0 VARCHAR(255),
    attribute_value1 VARCHAR(255),
    attribute_value2 VARCHAR(255),
    attribute_value3 VARCHAR(255),
    attribute_value4 VARCHAR(255),
    attribute_value5 VARCHAR(255),
    attribute_value6 VARCHAR(255),
    attribute_value7 VARCHAR(255),
    attribute_value8 VARCHAR(255),
    attribute_value9 VARCHAR(255),
    balance DECIMAL(27 , 12 ) NOT NULL,
    birth DATETIME,
    email VARCHAR(255) NOT NULL,
    gender INTEGER,
    is_enabled BIT NOT NULL,
    is_locked BIT NOT NULL,
    locked_date DATETIME,
    login_date DATETIME,
    login_failure_count INTEGER NOT NULL,
    login_ip VARCHAR(255),
    mobile VARCHAR(255),
    name VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    point BIGINT NOT NULL,
    register_ip VARCHAR(255) NOT NULL,
    safe_key_expire DATETIME,
    safe_key_value VARCHAR(255),
    username VARCHAR(100) NOT NULL UNIQUE,
    zip_code VARCHAR(255),
    area BIGINT,
    member_rank BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_member_attribute (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    is_enabled BIT NOT NULL,
    is_required BIT NOT NULL,
    name VARCHAR(255) NOT NULL,
    property_index INTEGER,
    `type` INTEGER NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_member_attribute_option (
    member_attribute BIGINT NOT NULL,
    options VARCHAR(255)
)  engine=innodb;

CREATE TABLE xx_member_favorite_product (
    favorite_members BIGINT NOT NULL,
    favorite_products BIGINT NOT NULL,
    PRIMARY KEY (favorite_members , favorite_products)
)  engine=innodb; 
  
CREATE TABLE xx_member_rank (
	id bigint not null auto_increment, 
	create_date datetime not null, 
	modify_date datetime not null, 
	amount decimal(21,6) unique, 
	is_default bit not null, 
	is_special bit not null, 
	name varchar(100) not null unique, 
	scale double precision not null, 
	primary key (id)
)engine=innodb;

CREATE TABLE xx_message (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    content LONGTEXT NOT NULL,
    ip VARCHAR(255) NOT NULL,
    is_draft BIT NOT NULL,
    receiver_delete BIT NOT NULL,
    receiver_read BIT NOT NULL,
    sender_delete BIT NOT NULL,
    sender_read BIT NOT NULL,
    title VARCHAR(255) NOT NULL,
    for_message BIGINT,
    receiver BIGINT,
    sender BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_navigation (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    is_blank_target BIT NOT NULL,
    name VARCHAR(255) NOT NULL,
    position INTEGER NOT NULL,
    url VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_order (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    address VARCHAR(255) NOT NULL,
    amount_paid DECIMAL(21 , 6 ) NOT NULL,
    area_name VARCHAR(255) NOT NULL,
    consignee VARCHAR(255) NOT NULL,
    coupon_discount DECIMAL(21 , 6 ) NOT NULL,
    expire DATETIME,
    fee DECIMAL(21 , 6 ) NOT NULL,
    freight DECIMAL(21 , 6 ) NOT NULL,
    invoice_title VARCHAR(255),
    is_allocated_stock BIT NOT NULL,
    is_invoice BIT NOT NULL,
    lock_expire DATETIME,
    memo VARCHAR(255),
    offset_amount DECIMAL(21 , 6 ) NOT NULL,
    order_status INTEGER NOT NULL,
    payment_method_name VARCHAR(255) NOT NULL,
    payment_status INTEGER NOT NULL,
    phone VARCHAR(255) NOT NULL,
    point BIGINT NOT NULL,
    promotion VARCHAR(255),
    promotion_discount DECIMAL(21 , 6 ) NOT NULL,
    shipping_method_name VARCHAR(255) NOT NULL,
    shipping_status INTEGER NOT NULL,
    shipped_date DATETIME,
    sn VARCHAR(100) NOT NULL UNIQUE,
    tax DECIMAL(21 , 6 ) NOT NULL,
    zip_code VARCHAR(255) NOT NULL,
    area BIGINT,
    coupon_code BIGINT,
    member BIGINT NOT NULL,
    operator BIGINT,
    payment_method BIGINT,
    shipping_method BIGINT,
    rebate DECIMAL(21 , 6 ),
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_order_coupon (
    orders BIGINT NOT NULL,
    coupons BIGINT NOT NULL
)  engine=innodb;

CREATE TABLE xx_order_item (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    is_gift BIT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(21 , 6 ) NOT NULL,
    quantity INTEGER NOT NULL,
    return_quantity INTEGER NOT NULL,
    shipped_quantity INTEGER NOT NULL,
    sn VARCHAR(255) NOT NULL,
    thumbnail VARCHAR(255),
    weight INTEGER,
    orders BIGINT NOT NULL,
    product BIGINT,
    supplier BIGINT,
    rebate_point DECIMAL(21 , 6 ) NOT NULL,
    rebate DECIMAL(21 , 6 ) NOT NULL,
    shipping_status INTEGER NOT NULL,
    platform_payment_status INTEGER NOT NULL,
    platform_payment BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_order_log (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    content VARCHAR(255),
    operator VARCHAR(255),
    `type` INTEGER NOT NULL,
    orders BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_parameter (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    name VARCHAR(255) NOT NULL,
    parameter_group BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_parameter_group (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    name VARCHAR(255) NOT NULL,
    product_category BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_payment (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    account VARCHAR(255),
    amount DECIMAL(21 , 6 ) NOT NULL,
    bank VARCHAR(255),
    expire DATETIME,
    fee DECIMAL(21 , 6 ) NOT NULL,
    memo VARCHAR(255),
    method INTEGER NOT NULL,
    operator VARCHAR(255),
    payer VARCHAR(255),
    payment_date DATETIME,
    payment_method VARCHAR(255),
    payment_plugin_id VARCHAR(255),
    sn VARCHAR(100) NOT NULL UNIQUE,
    trade_no VARCHAR(128),
    status INTEGER NOT NULL,
    `type` INTEGER NOT NULL,
    member BIGINT,
    orders BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_payment_method (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    content LONGTEXT,
    description VARCHAR(255),
    icon VARCHAR(255),
    method INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    timeout INTEGER,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_payment_shipping_method (
    payment_methods BIGINT NOT NULL,
    shipping_methods BIGINT NOT NULL,
    PRIMARY KEY (payment_methods , shipping_methods)
)  engine=innodb;

CREATE TABLE xx_plugin_config (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    is_enabled BIT NOT NULL,
    plugin_id VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_plugin_config_attribute (
    plugin_config BIGINT NOT NULL,
    attributes VARCHAR(255),
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (plugin_config , name)
)  engine=innodb;

CREATE TABLE xx_product (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    allocated_stock INTEGER NOT NULL,
    attribute_value0 VARCHAR(255),
    attribute_value1 VARCHAR(255),
    attribute_value10 VARCHAR(255),
    attribute_value11 VARCHAR(255),
    attribute_value12 VARCHAR(255),
    attribute_value13 VARCHAR(255),
    attribute_value14 VARCHAR(255),
    attribute_value15 VARCHAR(255),
    attribute_value16 VARCHAR(255),
    attribute_value17 VARCHAR(255),
    attribute_value18 VARCHAR(255),
    attribute_value19 VARCHAR(255),
    attribute_value2 VARCHAR(255),
    attribute_value3 VARCHAR(255),
    attribute_value4 VARCHAR(255),
    attribute_value5 VARCHAR(255),
    attribute_value6 VARCHAR(255),
    attribute_value7 VARCHAR(255),
    attribute_value8 VARCHAR(255),
    attribute_value9 VARCHAR(255),
    cost DECIMAL(21 , 6 ),
    full_name VARCHAR(255) NOT NULL,
    hits BIGINT NOT NULL,
    image VARCHAR(255),
    introduction LONGTEXT,
    is_gift BIT NOT NULL,
    is_list BIT NOT NULL,
    is_marketable BIT NOT NULL,
    is_top BIT NOT NULL,
    keyword VARCHAR(255),
    market_price DECIMAL(21 , 6 ) NOT NULL,
    memo VARCHAR(255),
    month_hits BIGINT NOT NULL,
    month_hits_date DATETIME NOT NULL,
    month_sales BIGINT NOT NULL,
    month_sales_date DATETIME NOT NULL,
    name VARCHAR(255) NOT NULL,
    point BIGINT NOT NULL,
    price DECIMAL(21 , 6 ) NOT NULL,
    sales BIGINT NOT NULL,
    score FLOAT NOT NULL,
    score_count BIGINT NOT NULL,
    seo_description VARCHAR(255),
    seo_keywords VARCHAR(255),
    seo_title VARCHAR(255),
    sn VARCHAR(100) NOT NULL UNIQUE,
    stock INTEGER,
    stock_memo VARCHAR(255),
    total_score BIGINT NOT NULL,
    unit VARCHAR(255),
    week_hits BIGINT NOT NULL,
    week_hits_date DATETIME NOT NULL,
    week_sales BIGINT NOT NULL,
    week_sales_date DATETIME NOT NULL,
    weight INTEGER,
    brand BIGINT,
    supplier BIGINT,
    rebate_point DECIMAL(21 , 6 ) NOT NULL,
    goods BIGINT NOT NULL,
    product_category BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_product_category (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    grade INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    seo_description VARCHAR(255),
    seo_keywords VARCHAR(255),
    seo_title VARCHAR(255),
    tree_path VARCHAR(255) NOT NULL,
    parent BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_product_category_brand (
    product_categories BIGINT NOT NULL,
    brands BIGINT NOT NULL,
    PRIMARY KEY (product_categories , brands)
)  engine=innodb;

CREATE TABLE xx_product_member_price (
    product BIGINT NOT NULL,
    member_price DECIMAL(19 , 2 ),
    member_price_key BIGINT NOT NULL,
    PRIMARY KEY (product , member_price_key)
)  engine=innodb;

CREATE TABLE xx_product_notify (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    email VARCHAR(255) NOT NULL,
    has_sent BIT NOT NULL,
    member BIGINT,
    product BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_product_parameter_value (
    product BIGINT NOT NULL,
    parameter_value VARCHAR(255),
    parameter_value_key BIGINT NOT NULL,
    PRIMARY KEY (product , parameter_value_key)
)  engine=innodb;

CREATE TABLE xx_product_product_image (
    product BIGINT NOT NULL,
    large VARCHAR(255),
    medium VARCHAR(255),
    orders INTEGER,
    source VARCHAR(255),
    thumbnail VARCHAR(255),
    title VARCHAR(255)
)  engine=innodb;

CREATE TABLE xx_product_specification (
    products BIGINT NOT NULL,
    specifications BIGINT NOT NULL,
    PRIMARY KEY (products , specifications)
)  engine=innodb;

CREATE TABLE xx_product_specification_value (
    products BIGINT NOT NULL,
    specification_values BIGINT NOT NULL,
    PRIMARY KEY (products , specification_values)
)  engine=innodb;

CREATE TABLE xx_product_tag (
    products BIGINT NOT NULL,
    tags BIGINT NOT NULL,
    PRIMARY KEY (products , tags)
)  engine=innodb;

CREATE TABLE xx_promotion (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    begin_date DATETIME,
    end_date DATETIME,
    introduction LONGTEXT,
    is_coupon_allowed BIT NOT NULL,
    is_free_shipping BIT NOT NULL,
    maximum_price DECIMAL(21 , 6 ),
    maximum_quantity INTEGER,
    minimum_price DECIMAL(21 , 6 ),
    minimum_quantity INTEGER,
    name VARCHAR(255) NOT NULL,
    point_expression VARCHAR(255),
    price_expression VARCHAR(255),
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_promotion_brand (
    promotions BIGINT NOT NULL,
    brands BIGINT NOT NULL,
    PRIMARY KEY (promotions , brands)
)  engine=innodb;

CREATE TABLE xx_promotion_coupon (
    promotions BIGINT NOT NULL,
    coupons BIGINT NOT NULL,
    PRIMARY KEY (promotions , coupons)
)  engine=innodb;

CREATE TABLE xx_promotion_member_rank (
    promotions BIGINT NOT NULL,
    member_ranks BIGINT NOT NULL,
    PRIMARY KEY (promotions , member_ranks)
)  engine=innodb;

CREATE TABLE xx_promotion_product (
    promotions BIGINT NOT NULL,
    products BIGINT NOT NULL,
    PRIMARY KEY (promotions , products)
)  engine=innodb;

CREATE TABLE xx_promotion_product_category (
    promotions BIGINT NOT NULL,
    product_categories BIGINT NOT NULL,
    PRIMARY KEY (promotions , product_categories)
)  engine=innodb;

CREATE TABLE xx_receiver (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    address VARCHAR(255) NOT NULL,
    area_name VARCHAR(255) NOT NULL,
    consignee VARCHAR(255) NOT NULL,
    is_default BIT NOT NULL,
    phone VARCHAR(255) NOT NULL,
    zip_code VARCHAR(255) NOT NULL,
    area BIGINT,
    member BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_refunds (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    account VARCHAR(255),
    amount DECIMAL(21 , 6 ) NOT NULL,
    bank VARCHAR(255),
    memo VARCHAR(255),
    method INTEGER NOT NULL,
    operator VARCHAR(255) NOT NULL,
    payee VARCHAR(255),
    payment_method VARCHAR(255),
    sn VARCHAR(100) NOT NULL UNIQUE,
    orders BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_returns (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    address VARCHAR(255) NOT NULL,
    area VARCHAR(255) NOT NULL,
    delivery_corp VARCHAR(255),
    freight DECIMAL(21 , 6 ),
    memo VARCHAR(255),
    operator VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    shipper VARCHAR(255) NOT NULL,
    shipping_method VARCHAR(255),
    sn VARCHAR(100) NOT NULL UNIQUE,
    tracking_no VARCHAR(255),
    zip_code VARCHAR(255) NOT NULL,
    orders BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_returns_item (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    name VARCHAR(255) NOT NULL,
    quantity INTEGER NOT NULL,
    sn VARCHAR(255) NOT NULL,
    returns BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_review (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    content VARCHAR(255) NOT NULL,
    ip VARCHAR(255) NOT NULL,
    is_show BIT NOT NULL,
    score INTEGER NOT NULL,
    member BIGINT,
    product BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_role (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    description VARCHAR(255),
    is_system BIT NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_role_authority (
    role BIGINT NOT NULL,
    authorities VARCHAR(255)
)  engine=innodb;

CREATE TABLE xx_seo (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    description VARCHAR(255),
    keywords VARCHAR(255),
    title VARCHAR(255),
    `type` INTEGER NOT NULL UNIQUE,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_shipping 
  ( 
     id                 BIGINT NOT NULL auto_increment, 
     create_date        DATETIME NOT NULL, 
     modify_date        DATETIME NOT NULL, 
     address            VARCHAR(255) NOT NULL, 
     area               VARCHAR(255) NOT NULL, 
     consignee          VARCHAR(255) NOT NULL, 
     delivery_corp      VARCHAR(255) NOT NULL, 
     delivery_corp_code VARCHAR(255), 
     delivery_corp_url  VARCHAR(255), 
     freight            DECIMAL(21, 6), 
     memo               VARCHAR(255), 
     operator           VARCHAR(255) NOT NULL, 
     phone              VARCHAR(255) NOT NULL, 
     shipping_method    VARCHAR(255) NOT NULL, 
     sn                 VARCHAR(100) NOT NULL UNIQUE, 
     tracking_no        VARCHAR(255), 
     zip_code           VARCHAR(255) NOT NULL, 
     orders             BIGINT NOT NULL,
     supplier			BIGINT,
     PRIMARY KEY (id) 
  )engine=innodb;

CREATE TABLE xx_shipping_item (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    name VARCHAR(255) NOT NULL,
    quantity INTEGER NOT NULL,
    sn VARCHAR(255) NOT NULL,
    shipping BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_shipping_method (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    continue_price DECIMAL(21 , 6 ) NOT NULL,
    continue_weight INTEGER NOT NULL,
    description LONGTEXT,
    first_price DECIMAL(21 , 6 ) NOT NULL,
    first_weight INTEGER NOT NULL,
    icon VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    default_delivery_corp BIGINT,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_sn (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    last_value BIGINT NOT NULL,
    `type` INTEGER NOT NULL UNIQUE,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_specification (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    memo VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    `type` INTEGER NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_specification_value (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    image VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    specification BIGINT NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_tag (
    id BIGINT NOT NULL auto_increment,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    orders INTEGER,
    icon VARCHAR(255),
    memo VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    `type` INTEGER NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_platform_payment (
    id BIGINT NOT NULL auto_increment,
    sn VARCHAR(100) UNIQUE,
    create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
    money DECIMAL(21 , 6 ) NOT NULL,
    memo VARCHAR(255),
    operator BIGINT NOT NULL,
    payee VARCHAR(100) NOT NULL,
    account VARCHAR(100) NOT NULL,
    supplier BIGINT NOT NULL,
    rebate DECIMAL(21 , 6 ) NOT NULL,
    PRIMARY KEY (id)
)  engine=innodb;

CREATE TABLE xx_cooperation (
	id BIGINT NOT NULL auto_increment,
	name VARCHAR(32) NOT NULL,
	phone VARCHAR(16) NOT NULL,
	email VARCHAR(32) NOT NULL,
	msg VARCHAR(512) NOT NULL,
	`status` SMALLINT NOT NULL,
	memo VARCHAR(512),
	create_date DATETIME NOT NULL,
    modify_date DATETIME NOT NULL,
	PRIMARY KEY (id)
) engine=innodb;

ALTER TABLE xx_platform_payment ADD INDEX xx_platform_pay_index_supplier (supplier), 
  ADD CONSTRAINT xx_platform_pay_fk_supplier FOREIGN KEY (supplier) REFERENCES 
  xx_supplier (id); 

ALTER TABLE xx_ad 
  ADD INDEX fk6d301c2e947c2f5 (ad_position), 
  ADD CONSTRAINT fk6d301c2e947c2f5 FOREIGN KEY (ad_position) REFERENCES 
  xx_ad_position (id); 

ALTER TABLE xx_admin_role 
  ADD INDEX fkd291d6053ff548f7 (roles), 
  ADD CONSTRAINT fkd291d6053ff548f7 FOREIGN KEY (roles) REFERENCES xx_role (id); 

ALTER TABLE xx_admin_role 
  ADD INDEX fkd291d605a022690f (admins), 
  ADD CONSTRAINT fkd291d605a022690f FOREIGN KEY (admins) REFERENCES xx_admin (id 
  ); 

ALTER TABLE xx_area 
  ADD INDEX fk9e19da6cfe1e12fb (parent), 
  ADD CONSTRAINT fk9e19da6cfe1e12fb FOREIGN KEY (parent) REFERENCES xx_area (id) 
; 

ALTER TABLE xx_article 
  ADD INDEX fk636982b7ca3b1f7 (article_category), 
  ADD CONSTRAINT fk636982b7ca3b1f7 FOREIGN KEY (article_category) REFERENCES 
  xx_article_category (id); 

ALTER TABLE xx_article_category 
  ADD INDEX fk57108986f587647a (parent), 
  ADD CONSTRAINT fk57108986f587647a FOREIGN KEY (parent) REFERENCES 
  xx_article_category (id); 

ALTER TABLE xx_article_tag 
  ADD INDEX fkb9183e12c842716f (tags), 
  ADD CONSTRAINT fkb9183e12c842716f FOREIGN KEY (tags) REFERENCES xx_tag (id); 

ALTER TABLE xx_article_tag 
  ADD INDEX fkb9183e1229f6deef (articles), 
  ADD CONSTRAINT fkb9183e1229f6deef FOREIGN KEY (articles) REFERENCES xx_article 
  (id); 

ALTER TABLE xx_attribute 
  ADD INDEX fke81f41dd7629117 (product_category), 
  ADD CONSTRAINT fke81f41dd7629117 FOREIGN KEY (product_category) REFERENCES 
  xx_product_category (id); 

ALTER TABLE xx_attribute_option 
  ADD INDEX fk96e026d75e1b95f4 (attribute), 
  ADD CONSTRAINT fk96e026d75e1b95f4 FOREIGN KEY (attribute) REFERENCES 
  xx_attribute (id); 

ALTER TABLE xx_cart 
  ADD INDEX fk9e1a84ff7c62edf8 (member), 
  ADD CONSTRAINT fk9e1a84ff7c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_cart_item 
  ADD INDEX fk1a67f65339a23004 (cart), 
  ADD CONSTRAINT fk1a67f65339a23004 FOREIGN KEY (cart) REFERENCES xx_cart (id); 

ALTER TABLE xx_cart_item 
  ADD INDEX fk1a67f65379f8d99a (product), 
  ADD CONSTRAINT fk1a67f65379f8d99a FOREIGN KEY (product) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_consultation 
  ADD INDEX fk33228d687c62edf8 (member), 
  ADD CONSTRAINT fk33228d687c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_consultation 
  ADD INDEX fk33228d68366b868c (for_consultation), 
  ADD CONSTRAINT fk33228d68366b868c FOREIGN KEY (for_consultation) REFERENCES 
  xx_consultation (id); 

ALTER TABLE xx_consultation 
  ADD INDEX fk33228d6879f8d99a (product), 
  ADD CONSTRAINT fk33228d6879f8d99a FOREIGN KEY (product) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_coupon_code 
  ADD INDEX fkef53a3a77c62edf8 (member), 
  ADD CONSTRAINT fkef53a3a77c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_coupon_code 
  ADD INDEX fkef53a3a75b638910 (coupon), 
  ADD CONSTRAINT fkef53a3a75b638910 FOREIGN KEY (coupon) REFERENCES xx_coupon ( 
  id); 

ALTER TABLE xx_delivery_center 
  ADD INDEX fk18eb77c139a0dade (area), 
  ADD CONSTRAINT fk18eb77c139a0dade FOREIGN KEY (area) REFERENCES xx_area (id); 

ALTER TABLE xx_deposit 
  ADD INDEX fkebb7cc5f7c62edf8 (member), 
  ADD CONSTRAINT fkebb7cc5f7c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_deposit 
  ADD INDEX fkebb7cc5f4115a3c8 (payment), 
  ADD CONSTRAINT fkebb7cc5f4115a3c8 FOREIGN KEY (payment) REFERENCES xx_payment 
  (id); 

ALTER TABLE xx_deposit 
  ADD INDEX fkebb7cc5fb992e8ef (orders), 
  ADD CONSTRAINT fkebb7cc5fb992e8ef FOREIGN KEY (orders) REFERENCES xx_order (id 
  ); 

ALTER TABLE xx_gift_item 
  ADD INDEX fk2fb85243fd463a02 (promotion), 
  ADD CONSTRAINT fk2fb85243fd463a02 FOREIGN KEY (promotion) REFERENCES 
  xx_promotion (id); 

ALTER TABLE xx_gift_item 
  ADD INDEX fk2fb852438c9b75db (gift), 
  ADD CONSTRAINT fk2fb852438c9b75db FOREIGN KEY (gift) REFERENCES xx_product (id 
  ); 

ALTER TABLE xx_member 
  ADD INDEX fk92d398b939a0dade (area), 
  ADD CONSTRAINT fk92d398b939a0dade FOREIGN KEY (area) REFERENCES xx_area (id); 

ALTER TABLE xx_member 
  ADD INDEX fk92d398b937884f5b (member_rank), 
  ADD CONSTRAINT fk92d398b937884f5b FOREIGN KEY (member_rank) REFERENCES 
  xx_member_rank (id); 

ALTER TABLE xx_member_attribute_option 
  ADD INDEX fkc3dc263e8a8815 (member_attribute), 
  ADD CONSTRAINT fkc3dc263e8a8815 FOREIGN KEY (member_attribute) REFERENCES 
  xx_member_attribute (id); 

ALTER TABLE xx_member_favorite_product 
  ADD INDEX fk44df1412a43b40d4 (favorite_members), 
  ADD CONSTRAINT fk44df1412a43b40d4 FOREIGN KEY (favorite_members) REFERENCES 
  xx_member (id); 

ALTER TABLE xx_member_favorite_product 
  ADD INDEX fk44df1412830d5552 (favorite_products), 
  ADD CONSTRAINT fk44df1412830d5552 FOREIGN KEY (favorite_products) REFERENCES 
  xx_product (id); 

ALTER TABLE xx_message 
  ADD INDEX fkc7fbb5c886a07d93 (sender), 
  ADD CONSTRAINT fkc7fbb5c886a07d93 FOREIGN KEY (sender) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_message 
  ADD INDEX fkc7fbb5c8e2b39a54 (for_message), 
  ADD CONSTRAINT fkc7fbb5c8e2b39a54 FOREIGN KEY (for_message) REFERENCES 
  xx_message (id); 

ALTER TABLE xx_message 
  ADD INDEX fkc7fbb5c88c6c4d4d (receiver), 
  ADD CONSTRAINT fkc7fbb5c88c6c4d4d FOREIGN KEY (receiver) REFERENCES xx_member 
  (id); 

ALTER TABLE xx_order 
  ADD INDEX fk25e6b94f67f7c585 (shipping_method), 
  ADD CONSTRAINT fk25e6b94f67f7c585 FOREIGN KEY (shipping_method) REFERENCES 
  xx_shipping_method (id); 

ALTER TABLE xx_order 
  ADD INDEX fk25e6b94f39a0dade (area), 
  ADD CONSTRAINT fk25e6b94f39a0dade FOREIGN KEY (area) REFERENCES xx_area (id); 

ALTER TABLE xx_order 
  ADD INDEX fk25e6b94f7c62edf8 (member), 
  ADD CONSTRAINT fk25e6b94f7c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_order 
  ADD INDEX fk25e6b94fc050045d (coupon_code), 
  ADD CONSTRAINT fk25e6b94fc050045d FOREIGN KEY (coupon_code) REFERENCES 
  xx_coupon_code (id); 

ALTER TABLE xx_order 
  ADD INDEX fk25e6b94fd7122aaf (operator), 
  ADD CONSTRAINT fk25e6b94fd7122aaf FOREIGN KEY (operator) REFERENCES xx_admin ( 
  id); 

ALTER TABLE xx_order 
  ADD INDEX fk25e6b94fd3a8be7d (payment_method), 
  ADD CONSTRAINT fk25e6b94fd3a8be7d FOREIGN KEY (payment_method) REFERENCES 
  xx_payment_method (id); 

ALTER TABLE xx_order_coupon 
  ADD INDEX fka3f6d516e538ddf7 (coupons), 
  ADD CONSTRAINT fka3f6d516e538ddf7 FOREIGN KEY (coupons) REFERENCES xx_coupon ( 
  id);

ALTER TABLE xx_order_coupon 
  ADD INDEX fka3f6d516b992e8ef (orders), 
  ADD CONSTRAINT fka3f6d516b992e8ef FOREIGN KEY (orders) REFERENCES xx_order (id 
  ); 

ALTER TABLE xx_order_item 
  ADD INDEX fkd69ff403b992e8ef (orders), 
  ADD CONSTRAINT fkd69ff403b992e8ef FOREIGN KEY (orders) REFERENCES xx_order (id 
  ); 

ALTER TABLE xx_order_item 
  ADD INDEX fkd69ff40379f8d99a (product), 
  ADD CONSTRAINT fkd69ff40379f8d99a FOREIGN KEY (product) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_order_item 
  ADD INDEX fk25e6b94fd7122ab0 (supplier), 
  ADD CONSTRAINT fk25e6b94fd7122b0 FOREIGN KEY (supplier) REFERENCES xx_supplier (id); 

ALTER TABLE xx_order_item
  ADD INDEX xx_order_item_index_platform_payment (platform_payment), ADD CONSTRAINT xx_order_item_fk_platform_payment FOREIGN KEY (platform_payment) REFERENCES xx_platform_payment 
  (id);

ALTER TABLE xx_order_log 
  ADD INDEX fkf6684c54b992e8ef (orders), 
  ADD CONSTRAINT fkf6684c54b992e8ef FOREIGN KEY (orders) REFERENCES xx_order (id 
  ); 

ALTER TABLE xx_parameter 
  ADD INDEX fk8238fd2a818bf383 (parameter_group), 
  ADD CONSTRAINT fk8238fd2a818bf383 FOREIGN KEY (parameter_group) REFERENCES 
  xx_parameter_group (id); 

ALTER TABLE xx_parameter_group 
  ADD INDEX fkd68a4f2ad7629117 (product_category), 
  ADD CONSTRAINT fkd68a4f2ad7629117 FOREIGN KEY (product_category) REFERENCES 
  xx_product_category (id); 

ALTER TABLE xx_payment 
  ADD INDEX fk602ce7c77c62edf8 (member), 
  ADD CONSTRAINT fk602ce7c77c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_payment 
  ADD INDEX fk602ce7c7b992e8ef (orders), 
  ADD CONSTRAINT fk602ce7c7b992e8ef FOREIGN KEY (orders) REFERENCES xx_order (id 
  ); 

ALTER TABLE xx_payment_shipping_method 
  ADD INDEX fkc230a01a85883714 (shipping_methods), 
  ADD CONSTRAINT fkc230a01a85883714 FOREIGN KEY (shipping_methods) REFERENCES 
  xx_shipping_method (id); 

ALTER TABLE xx_payment_shipping_method 
  ADD INDEX fkc230a01aa2ed13bc (payment_methods), 
  ADD CONSTRAINT fkc230a01aa2ed13bc FOREIGN KEY (payment_methods) REFERENCES 
  xx_payment_method (id); 

ALTER TABLE xx_plugin_config_attribute 
  ADD INDEX fk42cb712ce174c3e7 (plugin_config), 
  ADD CONSTRAINT fk42cb712ce174c3e7 FOREIGN KEY (plugin_config) REFERENCES 
  xx_plugin_config (id); 

ALTER TABLE xx_product 
  ADD INDEX fk7c9e82b0d7629117 (product_category), 
  ADD CONSTRAINT fk7c9e82b0d7629117 FOREIGN KEY (product_category) REFERENCES 
  xx_product_category (id); 

ALTER TABLE xx_product 
  ADD INDEX fk7c9e82b0fb212d68 (goods), 
  ADD CONSTRAINT fk7c9e82b0fb212d68 FOREIGN KEY (goods) REFERENCES xx_goods (id) 
; 

ALTER TABLE xx_product 
  ADD INDEX fk7c9e82b0fa9695ca (brand), 
  ADD CONSTRAINT fk7c9e82b0fa9695cb FOREIGN KEY (supplier) REFERENCES 
  xx_supplier (id); 

ALTER TABLE xx_product 
  ADD INDEX fk7c9e82b0fa9695cb (supplier), 
  ADD CONSTRAINT fk7c9e82b0fa9695cc FOREIGN KEY (brand) REFERENCES xx_brand (id) 
; 

ALTER TABLE xx_product_category 
  ADD INDEX fk1b7971adfbdd5b73 (parent), 
  ADD CONSTRAINT fk1b7971adfbdd5b73 FOREIGN KEY (parent) REFERENCES 
  xx_product_category (id); 

ALTER TABLE xx_product_category_brand 
  ADD INDEX fke42d6a75a2ab700f (brands), 
  ADD CONSTRAINT fke42d6a75a2ab700f FOREIGN KEY (brands) REFERENCES xx_brand (id 
  ); 

ALTER TABLE xx_product_category_brand 
  ADD INDEX fke42d6a758c4c0635 (product_categories), 
  ADD CONSTRAINT fke42d6a758c4c0635 FOREIGN KEY (product_categories) REFERENCES 
  xx_product_category (id); 

ALTER TABLE xx_product_member_price 
  ADD INDEX fkdccd88935ccd83ae (member_price_key), 
  ADD CONSTRAINT fkdccd88935ccd83ae FOREIGN KEY (member_price_key) REFERENCES 
  xx_member_rank (id); 

ALTER TABLE xx_product_member_price 
  ADD INDEX fkdccd889379f8d99a (product), 
  ADD CONSTRAINT fkdccd889379f8d99a FOREIGN KEY (product) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_product_notify 
  ADD INDEX fkdcb1abb87c62edf8 (member), 
  ADD CONSTRAINT fkdcb1abb87c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_product_notify 
  ADD INDEX fkdcb1abb879f8d99a (product), 
  ADD CONSTRAINT fkdcb1abb879f8d99a FOREIGN KEY (product) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_product_parameter_value 
  ADD INDEX fk1b76fdcceda221e0 (parameter_value_key), 
  ADD CONSTRAINT fk1b76fdcceda221e0 FOREIGN KEY (parameter_value_key) REFERENCES 
  xx_parameter (id); 

ALTER TABLE xx_product_parameter_value 
  ADD INDEX fk1b76fdcc79f8d99a (product), 
  ADD CONSTRAINT fk1b76fdcc79f8d99a FOREIGN KEY (product) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_product_product_image 
  ADD INDEX fk66470abc79f8d99a (product), 
  ADD CONSTRAINT fk66470abc79f8d99a FOREIGN KEY (product) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_product_specification 
  ADD INDEX fk622421b45096de0f (products), 
  ADD CONSTRAINT fk622421b45096de0f FOREIGN KEY (products) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_product_specification 
  ADD INDEX fk622421b4840da38f (specifications), 
  ADD CONSTRAINT fk622421b4840da38f FOREIGN KEY (specifications) REFERENCES 
  xx_specification (id); 

ALTER TABLE xx_product_specification_value 
  ADD INDEX fkbf71ff265096de0f (products), 
  ADD CONSTRAINT fkbf71ff265096de0f FOREIGN KEY (products) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_product_specification_value 
  ADD INDEX fkbf71ff2677bd1cd0 (specification_values), 
  ADD CONSTRAINT fkbf71ff2677bd1cd0 FOREIGN KEY (specification_values) 
  REFERENCES xx_specification_value (id); 

ALTER TABLE xx_product_tag 
  ADD INDEX fk2f6a998b5096de0f (products), 
  ADD CONSTRAINT fk2f6a998b5096de0f FOREIGN KEY (products) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_product_tag 
  ADD INDEX fk2f6a998bc842716f (tags), 
  ADD CONSTRAINT fk2f6a998bc842716f FOREIGN KEY (tags) REFERENCES xx_tag (id); 

ALTER TABLE xx_promotion_brand 
  ADD INDEX fkbd21c9aca2ab700f (brands), 
  ADD CONSTRAINT fkbd21c9aca2ab700f FOREIGN KEY (brands) REFERENCES xx_brand (id 
  ); 

ALTER TABLE xx_promotion_brand 
  ADD INDEX fkbd21c9ac682bd58f (promotions), 
  ADD CONSTRAINT fkbd21c9ac682bd58f FOREIGN KEY (promotions) REFERENCES 
  xx_promotion (id); 

ALTER TABLE xx_promotion_coupon 
  ADD INDEX fke8ab1ea1e538ddf7 (coupons), 
  ADD CONSTRAINT fke8ab1ea1e538ddf7 FOREIGN KEY (coupons) REFERENCES xx_coupon ( 
  id); 

ALTER TABLE xx_promotion_coupon 
  ADD INDEX fke8ab1ea1682bd58f (promotions), 
  ADD CONSTRAINT fke8ab1ea1682bd58f FOREIGN KEY (promotions) REFERENCES 
  xx_promotion (id); 

ALTER TABLE xx_promotion_member_rank 
  ADD INDEX fkff359916e24d908c (member_ranks), 
  ADD CONSTRAINT fkff359916e24d908c FOREIGN KEY (member_ranks) REFERENCES 
  xx_member_rank (id); 

ALTER TABLE xx_promotion_member_rank 
  ADD INDEX fkff359916682bd58f (promotions), 
  ADD CONSTRAINT fkff359916682bd58f FOREIGN KEY (promotions) REFERENCES 
  xx_promotion (id); 

ALTER TABLE xx_promotion_product 
  ADD INDEX fke12e55d45096de0f (products), 
  ADD CONSTRAINT fke12e55d45096de0f FOREIGN KEY (products) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_promotion_product 
  ADD INDEX fke12e55d4682bd58f (promotions), 
  ADD CONSTRAINT fke12e55d4682bd58f FOREIGN KEY (promotions) REFERENCES 
  xx_promotion (id); 

ALTER TABLE xx_promotion_product_category 
  ADD INDEX fk4a5ae7098c4c0635 (product_categories), 
  ADD CONSTRAINT fk4a5ae7098c4c0635 FOREIGN KEY (product_categories) REFERENCES 
  xx_product_category (id); 

ALTER TABLE xx_promotion_product_category 
  ADD INDEX fk4a5ae709682bd58f (promotions), 
  ADD CONSTRAINT fk4a5ae709682bd58f FOREIGN KEY (promotions) REFERENCES 
  xx_promotion (id); 

ALTER TABLE xx_receiver 
  ADD INDEX fk22d1ec4e39a0dade (area), 
  ADD CONSTRAINT fk22d1ec4e39a0dade FOREIGN KEY (area) REFERENCES xx_area (id); 

ALTER TABLE xx_receiver 
  ADD INDEX fk22d1ec4e7c62edf8 (member), 
  ADD CONSTRAINT fk22d1ec4e7c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_refunds 
  ADD INDEX fkcfc4c5bcb992e8ef (orders), 
  ADD CONSTRAINT fkcfc4c5bcb992e8ef FOREIGN KEY (orders) REFERENCES xx_order (id 
  ); 

ALTER TABLE xx_returns 
  ADD INDEX fkd08a1f04b992e8ef (orders), 
  ADD CONSTRAINT fkd08a1f04b992e8ef FOREIGN KEY (orders) REFERENCES xx_order (id 
  ); 

ALTER TABLE xx_returns_item 
  ADD INDEX fke830d76e21d01242 (returns), 
  ADD CONSTRAINT fke830d76e21d01242 FOREIGN KEY (returns) REFERENCES xx_returns 
  (id); 

ALTER TABLE xx_review 
  ADD INDEX fk9b6005777c62edf8 (member), 
  ADD CONSTRAINT fk9b6005777c62edf8 FOREIGN KEY (member) REFERENCES xx_member ( 
  id); 

ALTER TABLE xx_review 
  ADD INDEX fk9b60057779f8d99a (product), 
  ADD CONSTRAINT fk9b60057779f8d99a FOREIGN KEY (product) REFERENCES xx_product 
  (id); 

ALTER TABLE xx_role_authority 
  ADD INDEX fke06165d939b03ab0 (role), 
  ADD CONSTRAINT fke06165d939b03ab0 FOREIGN KEY (role) REFERENCES xx_role (id); 

ALTER TABLE xx_shipping 
  ADD INDEX fk3440e00db992e8ef (orders), 
  ADD CONSTRAINT fk3440e00db992e8ef FOREIGN KEY (orders) REFERENCES xx_order (id 
  );


ALTER TABLE xx_shipping 
  ADD INDEX fk3440e00db992e8f0 (supplier), 
  ADD CONSTRAINT fk3440e00db992e8f0 FOREIGN KEY (supplier) REFERENCES xx_supplier (id 
  );


ALTER TABLE xx_shipping_item 
  ADD INDEX fkcce65405ff407320 (shipping), 
  ADD CONSTRAINT fkcce65405ff407320 FOREIGN KEY (shipping) REFERENCES 
  xx_shipping (id); 

ALTER TABLE xx_shipping_method 
  ADD INDEX fk32a8355346542319 (default_delivery_corp), 
  ADD CONSTRAINT fk32a8355346542319 FOREIGN KEY (default_delivery_corp) 
  REFERENCES xx_delivery_corp (id); 

ALTER TABLE xx_specification_value 
  ADD INDEX fk5e624376629a04c2 (specification), 
  ADD CONSTRAINT fk5e624376629a04c2 FOREIGN KEY (specification) REFERENCES 
  xx_specification (id); 



insert into xx_role (id, create_date, modify_date, description, is_system, name) values(1, now(), now(), '拥有管理后台最高权限', b'1', '超级管理员');
insert into xx_role_authority (role, authorities) values(1, 'admin:cooperation');
insert into xx_role_authority (role, authorities) values(1, 'admin:supplier');
insert into xx_role_authority (role, authorities) values(1, 'admin:product');
insert into xx_role_authority (role, authorities) values(1, 'admin:productCategory');
insert into xx_role_authority (role, authorities) values(1, 'admin:parameterGroup');
insert into xx_role_authority (role, authorities) values(1, 'admin:attribute');
insert into xx_role_authority (role, authorities) values(1, 'admin:specification');
insert into xx_role_authority (role, authorities) values(1, 'admin:brand');
insert into xx_role_authority (role, authorities) values(1, 'admin:productNotify');
insert into xx_role_authority (role, authorities) values(1, 'admin:order');
insert into xx_role_authority (role, authorities) values(1, 'admin:print');
insert into xx_role_authority (role, authorities) values(1, 'admin:payment');
insert into xx_role_authority (role, authorities) values(1, 'admin:refunds');
insert into xx_role_authority (role, authorities) values(1, 'admin:shipping');
insert into xx_role_authority (role, authorities) values(1, 'admin:returns');
insert into xx_role_authority (role, authorities) values(1, 'admin:deliveryCenter');
insert into xx_role_authority (role, authorities) values(1, 'admin:deliveryTemplate');
insert into xx_role_authority (role, authorities) values(1, 'admin:member');
insert into xx_role_authority (role, authorities) values(1, 'admin:memberRank');
insert into xx_role_authority (role, authorities) values(1, 'admin:memberAttribute');
insert into xx_role_authority (role, authorities) values(1, 'admin:review');
insert into xx_role_authority (role, authorities) values(1, 'admin:consultation');
insert into xx_role_authority (role, authorities) values(1, 'admin:navigation');
insert into xx_role_authority (role, authorities) values(1, 'admin:article');
insert into xx_role_authority (role, authorities) values(1, 'admin:articleCategory');
insert into xx_role_authority (role, authorities) values(1, 'admin:tag');
insert into xx_role_authority (role, authorities) values(1, 'admin:friendLink');
insert into xx_role_authority (role, authorities) values(1, 'admin:adPosition');
insert into xx_role_authority (role, authorities) values(1, 'admin:ad');
insert into xx_role_authority (role, authorities) values(1, 'admin:template');
insert into xx_role_authority (role, authorities) values(1, 'admin:cache');
insert into xx_role_authority (role, authorities) values(1, 'admin:static');
insert into xx_role_authority (role, authorities) values(1, 'admin:index');
insert into xx_role_authority (role, authorities) values(1, 'admin:promotion');
insert into xx_role_authority (role, authorities) values(1, 'admin:coupon');
insert into xx_role_authority (role, authorities) values(1, 'admin:seo');
insert into xx_role_authority (role, authorities) values(1, 'admin:sitemap');
insert into xx_role_authority (role, authorities) values(1, 'admin:statistics');
insert into xx_role_authority (role, authorities) values(1, 'admin:sales');
insert into xx_role_authority (role, authorities) values(1, 'admin:salesRanking');
insert into xx_role_authority (role, authorities) values(1, 'admin:purchaseRanking');
insert into xx_role_authority (role, authorities) values(1, 'admin:deposit');
insert into xx_role_authority (role, authorities) values(1, 'admin:setting');
insert into xx_role_authority (role, authorities) values(1, 'admin:area');
insert into xx_role_authority (role, authorities) values(1, 'admin:paymentMethod');
insert into xx_role_authority (role, authorities) values(1, 'admin:shippingMethod');
insert into xx_role_authority (role, authorities) values(1, 'admin:deliveryCorp');
insert into xx_role_authority (role, authorities) values(1, 'admin:paymentPlugin');
insert into xx_role_authority (role, authorities) values(1, 'admin:storagePlugin');
insert into xx_role_authority (role, authorities) values(1, 'admin:admin');
insert into xx_role_authority (role, authorities) values(1, 'admin:role');
insert into xx_role_authority (role, authorities) values(1, 'admin:message');
insert into xx_role_authority (role, authorities) values(1, 'admin:log');
insert into xx_admin (id, create_date, modify_date, department, email, is_enabled, is_locked, locked_date, login_date, login_failure_count, login_ip, name, password, username) values(1, now(), now(), '技术部', 'aigechibaole@gmail.com', b'1', b'0', NULL, now(), 0, NULL, '管理员', '2642be3741187cf4fd729a08825a2d7c', 'admin');
insert into xx_admin_role (admins, roles) values(1, 1);
insert into xx_member_rank (id, create_date, modify_date, amount, is_default, is_special, name, scale) values(1, now(), now(), 0.000000, b'1', b'0', '普通会员', 1);
insert into xx_member_rank (id, create_date, modify_date, amount, is_default, is_special, name, scale) values(2, now(), now(), 1000.000000, b'0', b'0', '银牌会员', 1);
insert into xx_member_rank (id, create_date, modify_date, amount, is_default, is_special, name, scale) values(3, now(), now(), 10000.000000, b'0', b'0', '金牌会员', 1);
insert into xx_member_rank (id, create_date, modify_date, amount, is_default, is_special, name, scale) values(4, now(), now(), 100000.000000, b'0', b'0', '白金会员', 0.99);
insert into xx_member_rank (id, create_date, modify_date, amount, is_default, is_special, name, scale) values(5, now(), now(), NULL, b'0', b'1', '贵宾会员', 0.95);
insert into xx_member_attribute (id, create_date, modify_date, orders, is_enabled, is_required, name, property_index, `type`) values(1, now(), now(), 1, b'1', b'0', '姓名', NULL, 0);
insert into xx_member_attribute (id, create_date, modify_date, orders, is_enabled, is_required, name, property_index, `type`) values(2, now(), now(), 2, b'1', b'0', '性别', NULL, 1);
insert into xx_member_attribute (id, create_date, modify_date, orders, is_enabled, is_required, name, property_index, `type`) values(3, now(), now(), 3, b'1', b'0', '出生日期', NULL, 2);
insert into xx_member_attribute (id, create_date, modify_date, orders, is_enabled, is_required, name, property_index, `type`) values(4, now(), now(), 4, b'1', b'0', '地区', NULL, 3);
insert into xx_member_attribute (id, create_date, modify_date, orders, is_enabled, is_required, name, property_index, `type`) values(5, now(), now(), 5, b'1', b'0', '地址', NULL, 4);
insert into xx_member_attribute (id, create_date, modify_date, orders, is_enabled, is_required, name, property_index, `type`) values(6, now(), now(), 6, b'0', b'0', '邮编', NULL, 5);
insert into xx_member_attribute (id, create_date, modify_date, orders, is_enabled, is_required, name, property_index, `type`) values(7, now(), now(), 7, b'0', b'0', '电话', NULL, 6);
insert into xx_member_attribute (id, create_date, modify_date, orders, is_enabled, is_required, name, property_index, `type`) values(8, now(), now(), 8, b'0', b'0', '手机', NULL, 7);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1, now(), now(), NULL, '北京市', '北京市', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2, now(), now(), NULL, '北京市东城区', '东城区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3, now(), now(), NULL, '北京市西城区', '西城区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(4, now(), now(), NULL, '北京市朝阳区', '朝阳区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(5, now(), now(), NULL, '北京市丰台区', '丰台区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(6, now(), now(), NULL, '北京市石景山区', '石景山区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(7, now(), now(), NULL, '北京市海淀区', '海淀区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(8, now(), now(), NULL, '北京市门头沟区', '门头沟区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(9, now(), now(), NULL, '北京市房山区', '房山区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(10, now(), now(), NULL, '北京市通州区', '通州区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(11, now(), now(), NULL, '北京市顺义区', '顺义区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(12, now(), now(), NULL, '北京市昌平区', '昌平区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(13, now(), now(), NULL, '北京市大兴区', '大兴区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(14, now(), now(), NULL, '北京市怀柔区', '怀柔区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(15, now(), now(), NULL, '北京市平谷区', '平谷区', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(16, now(), now(), NULL, '北京市密云县', '密云县', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(17, now(), now(), NULL, '北京市延庆县', '延庆县', ',1,', 1);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(18, now(), now(), NULL, '天津市', '天津市', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(19, now(), now(), NULL, '天津市和平区', '和平区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(20, now(), now(), NULL, '天津市河东区', '河东区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(21, now(), now(), NULL, '天津市河西区', '河西区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(22, now(), now(), NULL, '天津市南开区', '南开区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(23, now(), now(), NULL, '天津市河北区', '河北区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(24, now(), now(), NULL, '天津市红桥区', '红桥区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(25, now(), now(), NULL, '天津市东丽区', '东丽区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(26, now(), now(), NULL, '天津市西青区', '西青区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(27, now(), now(), NULL, '天津市津南区', '津南区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(28, now(), now(), NULL, '天津市北辰区', '北辰区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(29, now(), now(), NULL, '天津市武清区', '武清区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(30, now(), now(), NULL, '天津市宝坻区', '宝坻区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(31, now(), now(), NULL, '天津市滨海新区', '滨海新区', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(32, now(), now(), NULL, '天津市宁河县', '宁河县', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(33, now(), now(), NULL, '天津市静海县', '静海县', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(34, now(), now(), NULL, '天津市蓟县', '蓟县', ',18,', 18);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(35, now(), now(), NULL, '河北省', '河北省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(36, now(), now(), NULL, '河北省石家庄市', '石家庄市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(37, now(), now(), NULL, '河北省石家庄市长安区', '长安区', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(38, now(), now(), NULL, '河北省石家庄市桥东区', '桥东区', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(39, now(), now(), NULL, '河北省石家庄市桥西区', '桥西区', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(40, now(), now(), NULL, '河北省石家庄市新华区', '新华区', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(41, now(), now(), NULL, '河北省石家庄市井陉矿区', '井陉矿区', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(42, now(), now(), NULL, '河北省石家庄市裕华区', '裕华区', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(43, now(), now(), NULL, '河北省石家庄市井陉县', '井陉县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(44, now(), now(), NULL, '河北省石家庄市正定县', '正定县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(45, now(), now(), NULL, '河北省石家庄市栾城县', '栾城县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(46, now(), now(), NULL, '河北省石家庄市行唐县', '行唐县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(47, now(), now(), NULL, '河北省石家庄市灵寿县', '灵寿县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(48, now(), now(), NULL, '河北省石家庄市高邑县', '高邑县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(49, now(), now(), NULL, '河北省石家庄市深泽县', '深泽县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(50, now(), now(), NULL, '河北省石家庄市赞皇县', '赞皇县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(51, now(), now(), NULL, '河北省石家庄市无极县', '无极县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(52, now(), now(), NULL, '河北省石家庄市平山县', '平山县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(53, now(), now(), NULL, '河北省石家庄市元氏县', '元氏县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(54, now(), now(), NULL, '河北省石家庄市赵县', '赵县', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(55, now(), now(), NULL, '河北省石家庄市辛集市', '辛集市', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(56, now(), now(), NULL, '河北省石家庄市藁城市', '藁城市', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(57, now(), now(), NULL, '河北省石家庄市晋州市', '晋州市', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(58, now(), now(), NULL, '河北省石家庄市新乐市', '新乐市', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(59, now(), now(), NULL, '河北省石家庄市鹿泉市', '鹿泉市', ',35,36,', 36);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(60, now(), now(), NULL, '河北省唐山市', '唐山市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(61, now(), now(), NULL, '河北省唐山市路南区', '路南区', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(62, now(), now(), NULL, '河北省唐山市路北区', '路北区', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(63, now(), now(), NULL, '河北省唐山市古冶区', '古冶区', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(64, now(), now(), NULL, '河北省唐山市开平区', '开平区', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(65, now(), now(), NULL, '河北省唐山市丰南区', '丰南区', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(66, now(), now(), NULL, '河北省唐山市丰润区', '丰润区', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(67, now(), now(), NULL, '河北省唐山市曹妃甸区', '曹妃甸区', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(68, now(), now(), NULL, '河北省唐山市滦县', '滦县', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(69, now(), now(), NULL, '河北省唐山市滦南县', '滦南县', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(70, now(), now(), NULL, '河北省唐山市乐亭县', '乐亭县', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(71, now(), now(), NULL, '河北省唐山市迁西县', '迁西县', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(72, now(), now(), NULL, '河北省唐山市玉田县', '玉田县', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(73, now(), now(), NULL, '河北省唐山市遵化市', '遵化市', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(74, now(), now(), NULL, '河北省唐山市迁安市', '迁安市', ',35,60,', 60);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(75, now(), now(), NULL, '河北省秦皇岛市', '秦皇岛市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(76, now(), now(), NULL, '河北省秦皇岛市海港区', '海港区', ',35,75,', 75);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(77, now(), now(), NULL, '河北省秦皇岛市山海关区', '山海关区', ',35,75,', 75);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(78, now(), now(), NULL, '河北省秦皇岛市北戴河区', '北戴河区', ',35,75,', 75);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(79, now(), now(), NULL, '河北省秦皇岛市青龙满族自治县', '青龙满族自治县', ',35,75,', 75);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(80, now(), now(), NULL, '河北省秦皇岛市昌黎县', '昌黎县', ',35,75,', 75);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(81, now(), now(), NULL, '河北省秦皇岛市抚宁县', '抚宁县', ',35,75,', 75);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(82, now(), now(), NULL, '河北省秦皇岛市卢龙县', '卢龙县', ',35,75,', 75);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(83, now(), now(), NULL, '河北省邯郸市', '邯郸市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(84, now(), now(), NULL, '河北省邯郸市邯山区', '邯山区', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(85, now(), now(), NULL, '河北省邯郸市丛台区', '丛台区', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(86, now(), now(), NULL, '河北省邯郸市复兴区', '复兴区', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(87, now(), now(), NULL, '河北省邯郸市峰峰矿区', '峰峰矿区', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(88, now(), now(), NULL, '河北省邯郸市邯郸县', '邯郸县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(89, now(), now(), NULL, '河北省邯郸市临漳县', '临漳县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(90, now(), now(), NULL, '河北省邯郸市成安县', '成安县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(91, now(), now(), NULL, '河北省邯郸市大名县', '大名县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(92, now(), now(), NULL, '河北省邯郸市涉县', '涉县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(93, now(), now(), NULL, '河北省邯郸市磁县', '磁县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(94, now(), now(), NULL, '河北省邯郸市肥乡县', '肥乡县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(95, now(), now(), NULL, '河北省邯郸市永年县', '永年县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(96, now(), now(), NULL, '河北省邯郸市邱县', '邱县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(97, now(), now(), NULL, '河北省邯郸市鸡泽县', '鸡泽县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(98, now(), now(), NULL, '河北省邯郸市广平县', '广平县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(99, now(), now(), NULL, '河北省邯郸市馆陶县', '馆陶县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(100, now(), now(), NULL, '河北省邯郸市魏县', '魏县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(101, now(), now(), NULL, '河北省邯郸市曲周县', '曲周县', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(102, now(), now(), NULL, '河北省邯郸市武安市', '武安市', ',35,83,', 83);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(103, now(), now(), NULL, '河北省邢台市', '邢台市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(104, now(), now(), NULL, '河北省邢台市桥东区', '桥东区', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(105, now(), now(), NULL, '河北省邢台市桥西区', '桥西区', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(106, now(), now(), NULL, '河北省邢台市邢台县', '邢台县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(107, now(), now(), NULL, '河北省邢台市临城县', '临城县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(108, now(), now(), NULL, '河北省邢台市内丘县', '内丘县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(109, now(), now(), NULL, '河北省邢台市柏乡县', '柏乡县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(110, now(), now(), NULL, '河北省邢台市隆尧县', '隆尧县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(111, now(), now(), NULL, '河北省邢台市任县', '任县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(112, now(), now(), NULL, '河北省邢台市南和县', '南和县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(113, now(), now(), NULL, '河北省邢台市宁晋县', '宁晋县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(114, now(), now(), NULL, '河北省邢台市巨鹿县', '巨鹿县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(115, now(), now(), NULL, '河北省邢台市新河县', '新河县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(116, now(), now(), NULL, '河北省邢台市广宗县', '广宗县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(117, now(), now(), NULL, '河北省邢台市平乡县', '平乡县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(118, now(), now(), NULL, '河北省邢台市威县', '威县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(119, now(), now(), NULL, '河北省邢台市清河县', '清河县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(120, now(), now(), NULL, '河北省邢台市临西县', '临西县', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(121, now(), now(), NULL, '河北省邢台市南宫市', '南宫市', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(122, now(), now(), NULL, '河北省邢台市沙河市', '沙河市', ',35,103,', 103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(123, now(), now(), NULL, '河北省保定市', '保定市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(124, now(), now(), NULL, '河北省保定市新市区', '新市区', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(125, now(), now(), NULL, '河北省保定市北市区', '北市区', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(126, now(), now(), NULL, '河北省保定市南市区', '南市区', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(127, now(), now(), NULL, '河北省保定市满城县', '满城县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(128, now(), now(), NULL, '河北省保定市清苑县', '清苑县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(129, now(), now(), NULL, '河北省保定市涞水县', '涞水县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(130, now(), now(), NULL, '河北省保定市阜平县', '阜平县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(131, now(), now(), NULL, '河北省保定市徐水县', '徐水县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(132, now(), now(), NULL, '河北省保定市定兴县', '定兴县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(133, now(), now(), NULL, '河北省保定市唐县', '唐县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(134, now(), now(), NULL, '河北省保定市高阳县', '高阳县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(135, now(), now(), NULL, '河北省保定市容城县', '容城县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(136, now(), now(), NULL, '河北省保定市涞源县', '涞源县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(137, now(), now(), NULL, '河北省保定市望都县', '望都县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(138, now(), now(), NULL, '河北省保定市安新县', '安新县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(139, now(), now(), NULL, '河北省保定市易县', '易县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(140, now(), now(), NULL, '河北省保定市曲阳县', '曲阳县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(141, now(), now(), NULL, '河北省保定市蠡县', '蠡县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(142, now(), now(), NULL, '河北省保定市顺平县', '顺平县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(143, now(), now(), NULL, '河北省保定市博野县', '博野县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(144, now(), now(), NULL, '河北省保定市雄县', '雄县', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(145, now(), now(), NULL, '河北省保定市涿州市', '涿州市', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(146, now(), now(), NULL, '河北省保定市定州市', '定州市', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(147, now(), now(), NULL, '河北省保定市安国市', '安国市', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(148, now(), now(), NULL, '河北省保定市高碑店市', '高碑店市', ',35,123,', 123);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(149, now(), now(), NULL, '河北省张家口市', '张家口市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(150, now(), now(), NULL, '河北省张家口市桥东区', '桥东区', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(151, now(), now(), NULL, '河北省张家口市桥西区', '桥西区', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(152, now(), now(), NULL, '河北省张家口市宣化区', '宣化区', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(153, now(), now(), NULL, '河北省张家口市下花园区', '下花园区', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(154, now(), now(), NULL, '河北省张家口市宣化县', '宣化县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(155, now(), now(), NULL, '河北省张家口市张北县', '张北县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(156, now(), now(), NULL, '河北省张家口市康保县', '康保县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(157, now(), now(), NULL, '河北省张家口市沽源县', '沽源县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(158, now(), now(), NULL, '河北省张家口市尚义县', '尚义县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(159, now(), now(), NULL, '河北省张家口市蔚县', '蔚县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(160, now(), now(), NULL, '河北省张家口市阳原县', '阳原县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(161, now(), now(), NULL, '河北省张家口市怀安县', '怀安县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(162, now(), now(), NULL, '河北省张家口市万全县', '万全县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(163, now(), now(), NULL, '河北省张家口市怀来县', '怀来县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(164, now(), now(), NULL, '河北省张家口市涿鹿县', '涿鹿县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(165, now(), now(), NULL, '河北省张家口市赤城县', '赤城县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(166, now(), now(), NULL, '河北省张家口市崇礼县', '崇礼县', ',35,149,', 149);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(167, now(), now(), NULL, '河北省承德市', '承德市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(168, now(), now(), NULL, '河北省承德市双桥区', '双桥区', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(169, now(), now(), NULL, '河北省承德市双滦区', '双滦区', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(170, now(), now(), NULL, '河北省承德市鹰手营子矿区', '鹰手营子矿区', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(171, now(), now(), NULL, '河北省承德市承德县', '承德县', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(172, now(), now(), NULL, '河北省承德市兴隆县', '兴隆县', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(173, now(), now(), NULL, '河北省承德市平泉县', '平泉县', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(174, now(), now(), NULL, '河北省承德市滦平县', '滦平县', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(175, now(), now(), NULL, '河北省承德市隆化县', '隆化县', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(176, now(), now(), NULL, '河北省承德市丰宁满族自治县', '丰宁满族自治县', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(177, now(), now(), NULL, '河北省承德市宽城满族自治县', '宽城满族自治县', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(178, now(), now(), NULL, '河北省承德市围场满族蒙古族自治县', '围场满族蒙古族自治县', ',35,167,', 167);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(179, now(), now(), NULL, '河北省沧州市', '沧州市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(180, now(), now(), NULL, '河北省沧州市新华区', '新华区', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(181, now(), now(), NULL, '河北省沧州市运河区', '运河区', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(182, now(), now(), NULL, '河北省沧州市沧县', '沧县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(183, now(), now(), NULL, '河北省沧州市青县', '青县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(184, now(), now(), NULL, '河北省沧州市东光县', '东光县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(185, now(), now(), NULL, '河北省沧州市海兴县', '海兴县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(186, now(), now(), NULL, '河北省沧州市盐山县', '盐山县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(187, now(), now(), NULL, '河北省沧州市肃宁县', '肃宁县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(188, now(), now(), NULL, '河北省沧州市南皮县', '南皮县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(189, now(), now(), NULL, '河北省沧州市吴桥县', '吴桥县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(190, now(), now(), NULL, '河北省沧州市献县', '献县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(191, now(), now(), NULL, '河北省沧州市孟村回族自治县', '孟村回族自治县', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(192, now(), now(), NULL, '河北省沧州市泊头市', '泊头市', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(193, now(), now(), NULL, '河北省沧州市任丘市', '任丘市', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(194, now(), now(), NULL, '河北省沧州市黄骅市', '黄骅市', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(195, now(), now(), NULL, '河北省沧州市河间市', '河间市', ',35,179,', 179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(196, now(), now(), NULL, '河北省廊坊市', '廊坊市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(197, now(), now(), NULL, '河北省廊坊市安次区', '安次区', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(198, now(), now(), NULL, '河北省廊坊市广阳区', '广阳区', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(199, now(), now(), NULL, '河北省廊坊市固安县', '固安县', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(200, now(), now(), NULL, '河北省廊坊市永清县', '永清县', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(201, now(), now(), NULL, '河北省廊坊市香河县', '香河县', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(202, now(), now(), NULL, '河北省廊坊市大城县', '大城县', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(203, now(), now(), NULL, '河北省廊坊市文安县', '文安县', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(204, now(), now(), NULL, '河北省廊坊市大厂回族自治县', '大厂回族自治县', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(205, now(), now(), NULL, '河北省廊坊市霸州市', '霸州市', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(206, now(), now(), NULL, '河北省廊坊市三河市', '三河市', ',35,196,', 196);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(207, now(), now(), NULL, '河北省衡水市', '衡水市', ',35,', 35);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(208, now(), now(), NULL, '河北省衡水市桃城区', '桃城区', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(209, now(), now(), NULL, '河北省衡水市枣强县', '枣强县', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(210, now(), now(), NULL, '河北省衡水市武邑县', '武邑县', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(211, now(), now(), NULL, '河北省衡水市武强县', '武强县', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(212, now(), now(), NULL, '河北省衡水市饶阳县', '饶阳县', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(213, now(), now(), NULL, '河北省衡水市安平县', '安平县', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(214, now(), now(), NULL, '河北省衡水市故城县', '故城县', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(215, now(), now(), NULL, '河北省衡水市景县', '景县', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(216, now(), now(), NULL, '河北省衡水市阜城县', '阜城县', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(217, now(), now(), NULL, '河北省衡水市冀州市', '冀州市', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(218, now(), now(), NULL, '河北省衡水市深州市', '深州市', ',35,207,', 207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(219, now(), now(), NULL, '山西省', '山西省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(220, now(), now(), NULL, '山西省太原市', '太原市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(221, now(), now(), NULL, '山西省太原市小店区', '小店区', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(222, now(), now(), NULL, '山西省太原市迎泽区', '迎泽区', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(223, now(), now(), NULL, '山西省太原市杏花岭区', '杏花岭区', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(224, now(), now(), NULL, '山西省太原市尖草坪区', '尖草坪区', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(225, now(), now(), NULL, '山西省太原市万柏林区', '万柏林区', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(226, now(), now(), NULL, '山西省太原市晋源区', '晋源区', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(227, now(), now(), NULL, '山西省太原市清徐县', '清徐县', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(228, now(), now(), NULL, '山西省太原市阳曲县', '阳曲县', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(229, now(), now(), NULL, '山西省太原市娄烦县', '娄烦县', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(230, now(), now(), NULL, '山西省太原市古交市', '古交市', ',219,220,', 220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(231, now(), now(), NULL, '山西省大同市', '大同市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(232, now(), now(), NULL, '山西省大同市城区', '城区', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(233, now(), now(), NULL, '山西省大同市矿区', '矿区', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(234, now(), now(), NULL, '山西省大同市南郊区', '南郊区', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(235, now(), now(), NULL, '山西省大同市新荣区', '新荣区', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(236, now(), now(), NULL, '山西省大同市阳高县', '阳高县', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(237, now(), now(), NULL, '山西省大同市天镇县', '天镇县', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(238, now(), now(), NULL, '山西省大同市广灵县', '广灵县', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(239, now(), now(), NULL, '山西省大同市灵丘县', '灵丘县', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(240, now(), now(), NULL, '山西省大同市浑源县', '浑源县', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(241, now(), now(), NULL, '山西省大同市左云县', '左云县', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(242, now(), now(), NULL, '山西省大同市大同县', '大同县', ',219,231,', 231);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(243, now(), now(), NULL, '山西省阳泉市', '阳泉市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(244, now(), now(), NULL, '山西省阳泉市城区', '城区', ',219,243,', 243);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(245, now(), now(), NULL, '山西省阳泉市矿区', '矿区', ',219,243,', 243);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(246, now(), now(), NULL, '山西省阳泉市郊区', '郊区', ',219,243,', 243);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(247, now(), now(), NULL, '山西省阳泉市平定县', '平定县', ',219,243,', 243);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(248, now(), now(), NULL, '山西省阳泉市盂县', '盂县', ',219,243,', 243);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(249, now(), now(), NULL, '山西省长治市', '长治市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(250, now(), now(), NULL, '山西省长治市城区', '城区', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(251, now(), now(), NULL, '山西省长治市郊区', '郊区', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(252, now(), now(), NULL, '山西省长治市长治县', '长治县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(253, now(), now(), NULL, '山西省长治市襄垣县', '襄垣县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(254, now(), now(), NULL, '山西省长治市屯留县', '屯留县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(255, now(), now(), NULL, '山西省长治市平顺县', '平顺县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(256, now(), now(), NULL, '山西省长治市黎城县', '黎城县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(257, now(), now(), NULL, '山西省长治市壶关县', '壶关县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(258, now(), now(), NULL, '山西省长治市长子县', '长子县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(259, now(), now(), NULL, '山西省长治市武乡县', '武乡县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(260, now(), now(), NULL, '山西省长治市沁县', '沁县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(261, now(), now(), NULL, '山西省长治市沁源县', '沁源县', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(262, now(), now(), NULL, '山西省长治市潞城市', '潞城市', ',219,249,', 249);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(263, now(), now(), NULL, '山西省晋城市', '晋城市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(264, now(), now(), NULL, '山西省晋城市晋城市市辖区', '晋城市市辖区', ',219,263,', 263);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(265, now(), now(), NULL, '山西省晋城市城区', '城区', ',219,263,', 263);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(266, now(), now(), NULL, '山西省晋城市沁水县', '沁水县', ',219,263,', 263);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(267, now(), now(), NULL, '山西省晋城市阳城县', '阳城县', ',219,263,', 263);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(268, now(), now(), NULL, '山西省晋城市陵川县', '陵川县', ',219,263,', 263);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(269, now(), now(), NULL, '山西省晋城市泽州县', '泽州县', ',219,263,', 263);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(270, now(), now(), NULL, '山西省晋城市高平市', '高平市', ',219,263,', 263);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(271, now(), now(), NULL, '山西省朔州市', '朔州市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(272, now(), now(), NULL, '山西省朔州市朔城区', '朔城区', ',219,271,', 271);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(273, now(), now(), NULL, '山西省朔州市平鲁区', '平鲁区', ',219,271,', 271);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(274, now(), now(), NULL, '山西省朔州市山阴县', '山阴县', ',219,271,', 271);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(275, now(), now(), NULL, '山西省朔州市应县', '应县', ',219,271,', 271);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(276, now(), now(), NULL, '山西省朔州市右玉县', '右玉县', ',219,271,', 271);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(277, now(), now(), NULL, '山西省朔州市怀仁县', '怀仁县', ',219,271,', 271);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(278, now(), now(), NULL, '山西省晋中市', '晋中市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(279, now(), now(), NULL, '山西省晋中市榆次区', '榆次区', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(280, now(), now(), NULL, '山西省晋中市榆社县', '榆社县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(281, now(), now(), NULL, '山西省晋中市左权县', '左权县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(282, now(), now(), NULL, '山西省晋中市和顺县', '和顺县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(283, now(), now(), NULL, '山西省晋中市昔阳县', '昔阳县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(284, now(), now(), NULL, '山西省晋中市寿阳县', '寿阳县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(285, now(), now(), NULL, '山西省晋中市太谷县', '太谷县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(286, now(), now(), NULL, '山西省晋中市祁县', '祁县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(287, now(), now(), NULL, '山西省晋中市平遥县', '平遥县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(288, now(), now(), NULL, '山西省晋中市灵石县', '灵石县', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(289, now(), now(), NULL, '山西省晋中市介休市', '介休市', ',219,278,', 278);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(290, now(), now(), NULL, '山西省运城市', '运城市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(291, now(), now(), NULL, '山西省运城市盐湖区', '盐湖区', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(292, now(), now(), NULL, '山西省运城市临猗县', '临猗县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(293, now(), now(), NULL, '山西省运城市万荣县', '万荣县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(294, now(), now(), NULL, '山西省运城市闻喜县', '闻喜县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(295, now(), now(), NULL, '山西省运城市稷山县', '稷山县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(296, now(), now(), NULL, '山西省运城市新绛县', '新绛县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(297, now(), now(), NULL, '山西省运城市绛县', '绛县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(298, now(), now(), NULL, '山西省运城市垣曲县', '垣曲县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(299, now(), now(), NULL, '山西省运城市夏县', '夏县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(300, now(), now(), NULL, '山西省运城市平陆县', '平陆县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(301, now(), now(), NULL, '山西省运城市芮城县', '芮城县', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(302, now(), now(), NULL, '山西省运城市永济市', '永济市', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(303, now(), now(), NULL, '山西省运城市河津市', '河津市', ',219,290,', 290);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(304, now(), now(), NULL, '山西省忻州市', '忻州市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(305, now(), now(), NULL, '山西省忻州市忻府区', '忻府区', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(306, now(), now(), NULL, '山西省忻州市定襄县', '定襄县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(307, now(), now(), NULL, '山西省忻州市五台县', '五台县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(308, now(), now(), NULL, '山西省忻州市代县', '代县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(309, now(), now(), NULL, '山西省忻州市繁峙县', '繁峙县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(310, now(), now(), NULL, '山西省忻州市宁武县', '宁武县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(311, now(), now(), NULL, '山西省忻州市静乐县', '静乐县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(312, now(), now(), NULL, '山西省忻州市神池县', '神池县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(313, now(), now(), NULL, '山西省忻州市五寨县', '五寨县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(314, now(), now(), NULL, '山西省忻州市岢岚县', '岢岚县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(315, now(), now(), NULL, '山西省忻州市河曲县', '河曲县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(316, now(), now(), NULL, '山西省忻州市保德县', '保德县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(317, now(), now(), NULL, '山西省忻州市偏关县', '偏关县', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(318, now(), now(), NULL, '山西省忻州市原平市', '原平市', ',219,304,', 304);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(319, now(), now(), NULL, '山西省临汾市', '临汾市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(320, now(), now(), NULL, '山西省临汾市尧都区', '尧都区', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(321, now(), now(), NULL, '山西省临汾市曲沃县', '曲沃县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(322, now(), now(), NULL, '山西省临汾市翼城县', '翼城县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(323, now(), now(), NULL, '山西省临汾市襄汾县', '襄汾县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(324, now(), now(), NULL, '山西省临汾市洪洞县', '洪洞县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(325, now(), now(), NULL, '山西省临汾市古县', '古县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(326, now(), now(), NULL, '山西省临汾市安泽县', '安泽县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(327, now(), now(), NULL, '山西省临汾市浮山县', '浮山县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(328, now(), now(), NULL, '山西省临汾市吉县', '吉县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(329, now(), now(), NULL, '山西省临汾市乡宁县', '乡宁县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(330, now(), now(), NULL, '山西省临汾市大宁县', '大宁县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(331, now(), now(), NULL, '山西省临汾市隰县', '隰县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(332, now(), now(), NULL, '山西省临汾市永和县', '永和县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(333, now(), now(), NULL, '山西省临汾市蒲县', '蒲县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(334, now(), now(), NULL, '山西省临汾市汾西县', '汾西县', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(335, now(), now(), NULL, '山西省临汾市侯马市', '侯马市', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(336, now(), now(), NULL, '山西省临汾市霍州市', '霍州市', ',219,319,', 319);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(337, now(), now(), NULL, '山西省吕梁市', '吕梁市', ',219,', 219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(338, now(), now(), NULL, '山西省吕梁市离石区', '离石区', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(339, now(), now(), NULL, '山西省吕梁市文水县', '文水县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(340, now(), now(), NULL, '山西省吕梁市交城县', '交城县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(341, now(), now(), NULL, '山西省吕梁市兴县', '兴县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(342, now(), now(), NULL, '山西省吕梁市临县', '临县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(343, now(), now(), NULL, '山西省吕梁市柳林县', '柳林县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(344, now(), now(), NULL, '山西省吕梁市石楼县', '石楼县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(345, now(), now(), NULL, '山西省吕梁市岚县', '岚县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(346, now(), now(), NULL, '山西省吕梁市方山县', '方山县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(347, now(), now(), NULL, '山西省吕梁市中阳县', '中阳县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(348, now(), now(), NULL, '山西省吕梁市交口县', '交口县', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(349, now(), now(), NULL, '山西省吕梁市孝义市', '孝义市', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(350, now(), now(), NULL, '山西省吕梁市汾阳市', '汾阳市', ',219,337,', 337);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(351, now(), now(), NULL, '内蒙古自治区', '内蒙古自治区', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(352, now(), now(), NULL, '内蒙古自治区呼和浩特市', '呼和浩特市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(353, now(), now(), NULL, '内蒙古自治区呼和浩特市新城区', '新城区', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(354, now(), now(), NULL, '内蒙古自治区呼和浩特市回民区', '回民区', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(355, now(), now(), NULL, '内蒙古自治区呼和浩特市玉泉区', '玉泉区', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(356, now(), now(), NULL, '内蒙古自治区呼和浩特市赛罕区', '赛罕区', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(357, now(), now(), NULL, '内蒙古自治区呼和浩特市土默特左旗', '土默特左旗', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(358, now(), now(), NULL, '内蒙古自治区呼和浩特市托克托县', '托克托县', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(359, now(), now(), NULL, '内蒙古自治区呼和浩特市和林格尔县', '和林格尔县', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(360, now(), now(), NULL, '内蒙古自治区呼和浩特市清水河县', '清水河县', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(361, now(), now(), NULL, '内蒙古自治区呼和浩特市武川县', '武川县', ',351,352,', 352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(362, now(), now(), NULL, '内蒙古自治区包头市', '包头市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(363, now(), now(), NULL, '内蒙古自治区包头市东河区', '东河区', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(364, now(), now(), NULL, '内蒙古自治区包头市昆都仑区', '昆都仑区', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(365, now(), now(), NULL, '内蒙古自治区包头市青山区', '青山区', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(366, now(), now(), NULL, '内蒙古自治区包头市石拐区', '石拐区', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(367, now(), now(), NULL, '内蒙古自治区包头市白云鄂博矿区', '白云鄂博矿区', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(368, now(), now(), NULL, '内蒙古自治区包头市九原区', '九原区', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(369, now(), now(), NULL, '内蒙古自治区包头市土默特右旗', '土默特右旗', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(370, now(), now(), NULL, '内蒙古自治区包头市固阳县', '固阳县', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(371, now(), now(), NULL, '内蒙古自治区包头市达尔罕茂明安联合旗', '达尔罕茂明安联合旗', ',351,362,', 362);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(372, now(), now(), NULL, '内蒙古自治区乌海市', '乌海市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(373, now(), now(), NULL, '内蒙古自治区乌海市海勃湾区', '海勃湾区', ',351,372,', 372);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(374, now(), now(), NULL, '内蒙古自治区乌海市海南区', '海南区', ',351,372,', 372);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(375, now(), now(), NULL, '内蒙古自治区乌海市乌达区', '乌达区', ',351,372,', 372);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(376, now(), now(), NULL, '内蒙古自治区赤峰市', '赤峰市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(377, now(), now(), NULL, '内蒙古自治区赤峰市红山区', '红山区', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(378, now(), now(), NULL, '内蒙古自治区赤峰市元宝山区', '元宝山区', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(379, now(), now(), NULL, '内蒙古自治区赤峰市松山区', '松山区', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(380, now(), now(), NULL, '内蒙古自治区赤峰市阿鲁科尔沁旗', '阿鲁科尔沁旗', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(381, now(), now(), NULL, '内蒙古自治区赤峰市巴林左旗', '巴林左旗', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(382, now(), now(), NULL, '内蒙古自治区赤峰市巴林右旗', '巴林右旗', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(383, now(), now(), NULL, '内蒙古自治区赤峰市林西县', '林西县', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(384, now(), now(), NULL, '内蒙古自治区赤峰市克什克腾旗', '克什克腾旗', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(385, now(), now(), NULL, '内蒙古自治区赤峰市翁牛特旗', '翁牛特旗', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(386, now(), now(), NULL, '内蒙古自治区赤峰市喀喇沁旗', '喀喇沁旗', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(387, now(), now(), NULL, '内蒙古自治区赤峰市宁城县', '宁城县', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(388, now(), now(), NULL, '内蒙古自治区赤峰市敖汉旗', '敖汉旗', ',351,376,', 376);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(389, now(), now(), NULL, '内蒙古自治区通辽市', '通辽市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(390, now(), now(), NULL, '内蒙古自治区通辽市科尔沁区', '科尔沁区', ',351,389,', 389);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(391, now(), now(), NULL, '内蒙古自治区通辽市科尔沁左翼中旗', '科尔沁左翼中旗', ',351,389,', 389);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(392, now(), now(), NULL, '内蒙古自治区通辽市科尔沁左翼后旗', '科尔沁左翼后旗', ',351,389,', 389);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(393, now(), now(), NULL, '内蒙古自治区通辽市开鲁县', '开鲁县', ',351,389,', 389);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(394, now(), now(), NULL, '内蒙古自治区通辽市库伦旗', '库伦旗', ',351,389,', 389);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(395, now(), now(), NULL, '内蒙古自治区通辽市奈曼旗', '奈曼旗', ',351,389,', 389);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(396, now(), now(), NULL, '内蒙古自治区通辽市扎鲁特旗', '扎鲁特旗', ',351,389,', 389);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(397, now(), now(), NULL, '内蒙古自治区通辽市霍林郭勒市', '霍林郭勒市', ',351,389,', 389);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(398, now(), now(), NULL, '内蒙古自治区鄂尔多斯市', '鄂尔多斯市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(399, now(), now(), NULL, '内蒙古自治区鄂尔多斯市东胜区', '东胜区', ',351,398,', 398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(400, now(), now(), NULL, '内蒙古自治区鄂尔多斯市达拉特旗', '达拉特旗', ',351,398,', 398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(401, now(), now(), NULL, '内蒙古自治区鄂尔多斯市准格尔旗', '准格尔旗', ',351,398,', 398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(402, now(), now(), NULL, '内蒙古自治区鄂尔多斯市鄂托克前旗', '鄂托克前旗', ',351,398,', 398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(403, now(), now(), NULL, '内蒙古自治区鄂尔多斯市鄂托克旗', '鄂托克旗', ',351,398,', 398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(404, now(), now(), NULL, '内蒙古自治区鄂尔多斯市杭锦旗', '杭锦旗', ',351,398,', 398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(405, now(), now(), NULL, '内蒙古自治区鄂尔多斯市乌审旗', '乌审旗', ',351,398,', 398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(406, now(), now(), NULL, '内蒙古自治区鄂尔多斯市伊金霍洛旗', '伊金霍洛旗', ',351,398,', 398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(407, now(), now(), NULL, '内蒙古自治区呼伦贝尔市', '呼伦贝尔市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(408, now(), now(), NULL, '内蒙古自治区呼伦贝尔市海拉尔区', '海拉尔区', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(409, now(), now(), NULL, '内蒙古自治区呼伦贝尔市阿荣旗', '阿荣旗', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(410, now(), now(), NULL, '内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗', '莫力达瓦达斡尔族自治旗', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(411, now(), now(), NULL, '内蒙古自治区呼伦贝尔市鄂伦春自治旗', '鄂伦春自治旗', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(412, now(), now(), NULL, '内蒙古自治区呼伦贝尔市鄂温克族自治旗', '鄂温克族自治旗', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(413, now(), now(), NULL, '内蒙古自治区呼伦贝尔市陈巴尔虎旗', '陈巴尔虎旗', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(414, now(), now(), NULL, '内蒙古自治区呼伦贝尔市新巴尔虎左旗', '新巴尔虎左旗', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(415, now(), now(), NULL, '内蒙古自治区呼伦贝尔市新巴尔虎右旗', '新巴尔虎右旗', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(416, now(), now(), NULL, '内蒙古自治区呼伦贝尔市满洲里市', '满洲里市', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(417, now(), now(), NULL, '内蒙古自治区呼伦贝尔市牙克石市', '牙克石市', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(418, now(), now(), NULL, '内蒙古自治区呼伦贝尔市扎兰屯市', '扎兰屯市', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(419, now(), now(), NULL, '内蒙古自治区呼伦贝尔市额尔古纳市', '额尔古纳市', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(420, now(), now(), NULL, '内蒙古自治区呼伦贝尔市根河市', '根河市', ',351,407,', 407);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(421, now(), now(), NULL, '内蒙古自治区巴彦淖尔市', '巴彦淖尔市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(422, now(), now(), NULL, '内蒙古自治区巴彦淖尔市临河区', '临河区', ',351,421,', 421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(423, now(), now(), NULL, '内蒙古自治区巴彦淖尔市五原县', '五原县', ',351,421,', 421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(424, now(), now(), NULL, '内蒙古自治区巴彦淖尔市磴口县', '磴口县', ',351,421,', 421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(425, now(), now(), NULL, '内蒙古自治区巴彦淖尔市乌拉特前旗', '乌拉特前旗', ',351,421,', 421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(426, now(), now(), NULL, '内蒙古自治区巴彦淖尔市乌拉特中旗', '乌拉特中旗', ',351,421,', 421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(427, now(), now(), NULL, '内蒙古自治区巴彦淖尔市乌拉特后旗', '乌拉特后旗', ',351,421,', 421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(428, now(), now(), NULL, '内蒙古自治区巴彦淖尔市杭锦后旗', '杭锦后旗', ',351,421,', 421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(429, now(), now(), NULL, '内蒙古自治区乌兰察布市', '乌兰察布市', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(430, now(), now(), NULL, '内蒙古自治区乌兰察布市集宁区', '集宁区', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(431, now(), now(), NULL, '内蒙古自治区乌兰察布市卓资县', '卓资县', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(432, now(), now(), NULL, '内蒙古自治区乌兰察布市化德县', '化德县', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(433, now(), now(), NULL, '内蒙古自治区乌兰察布市商都县', '商都县', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(434, now(), now(), NULL, '内蒙古自治区乌兰察布市兴和县', '兴和县', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(435, now(), now(), NULL, '内蒙古自治区乌兰察布市凉城县', '凉城县', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(436, now(), now(), NULL, '内蒙古自治区乌兰察布市察哈尔右翼前旗', '察哈尔右翼前旗', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(437, now(), now(), NULL, '内蒙古自治区乌兰察布市察哈尔右翼中旗', '察哈尔右翼中旗', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(438, now(), now(), NULL, '内蒙古自治区乌兰察布市察哈尔右翼后旗', '察哈尔右翼后旗', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(439, now(), now(), NULL, '内蒙古自治区乌兰察布市四子王旗', '四子王旗', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(440, now(), now(), NULL, '内蒙古自治区乌兰察布市丰镇市', '丰镇市', ',351,429,', 429);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(441, now(), now(), NULL, '内蒙古自治区兴安盟', '兴安盟', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(442, now(), now(), NULL, '内蒙古自治区兴安盟乌兰浩特市', '乌兰浩特市', ',351,441,', 441);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(443, now(), now(), NULL, '内蒙古自治区兴安盟阿尔山市', '阿尔山市', ',351,441,', 441);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(444, now(), now(), NULL, '内蒙古自治区兴安盟科尔沁右翼前旗', '科尔沁右翼前旗', ',351,441,', 441);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(445, now(), now(), NULL, '内蒙古自治区兴安盟科尔沁右翼中旗', '科尔沁右翼中旗', ',351,441,', 441);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(446, now(), now(), NULL, '内蒙古自治区兴安盟扎赉特旗', '扎赉特旗', ',351,441,', 441);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(447, now(), now(), NULL, '内蒙古自治区兴安盟突泉县', '突泉县', ',351,441,', 441);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(448, now(), now(), NULL, '内蒙古自治区锡林郭勒盟', '锡林郭勒盟', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(449, now(), now(), NULL, '内蒙古自治区锡林郭勒盟二连浩特市', '二连浩特市', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(450, now(), now(), NULL, '内蒙古自治区锡林郭勒盟锡林浩特市', '锡林浩特市', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(451, now(), now(), NULL, '内蒙古自治区锡林郭勒盟阿巴嘎旗', '阿巴嘎旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(452, now(), now(), NULL, '内蒙古自治区锡林郭勒盟苏尼特左旗', '苏尼特左旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(453, now(), now(), NULL, '内蒙古自治区锡林郭勒盟苏尼特右旗', '苏尼特右旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(454, now(), now(), NULL, '内蒙古自治区锡林郭勒盟东乌珠穆沁旗', '东乌珠穆沁旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(455, now(), now(), NULL, '内蒙古自治区锡林郭勒盟西乌珠穆沁旗', '西乌珠穆沁旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(456, now(), now(), NULL, '内蒙古自治区锡林郭勒盟太仆寺旗', '太仆寺旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(457, now(), now(), NULL, '内蒙古自治区锡林郭勒盟镶黄旗', '镶黄旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(458, now(), now(), NULL, '内蒙古自治区锡林郭勒盟正镶白旗', '正镶白旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(459, now(), now(), NULL, '内蒙古自治区锡林郭勒盟正蓝旗', '正蓝旗', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(460, now(), now(), NULL, '内蒙古自治区锡林郭勒盟多伦县', '多伦县', ',351,448,', 448);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(461, now(), now(), NULL, '内蒙古自治区阿拉善盟', '阿拉善盟', ',351,', 351);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(462, now(), now(), NULL, '内蒙古自治区阿拉善盟阿拉善左旗', '阿拉善左旗', ',351,461,', 461);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(463, now(), now(), NULL, '内蒙古自治区阿拉善盟阿拉善右旗', '阿拉善右旗', ',351,461,', 461);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(464, now(), now(), NULL, '内蒙古自治区阿拉善盟额济纳旗', '额济纳旗', ',351,461,', 461);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(465, now(), now(), NULL, '辽宁省', '辽宁省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(466, now(), now(), NULL, '辽宁省沈阳市', '沈阳市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(467, now(), now(), NULL, '辽宁省沈阳市和平区', '和平区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(468, now(), now(), NULL, '辽宁省沈阳市沈河区', '沈河区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(469, now(), now(), NULL, '辽宁省沈阳市大东区', '大东区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(470, now(), now(), NULL, '辽宁省沈阳市皇姑区', '皇姑区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(471, now(), now(), NULL, '辽宁省沈阳市铁西区', '铁西区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(472, now(), now(), NULL, '辽宁省沈阳市苏家屯区', '苏家屯区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(473, now(), now(), NULL, '辽宁省沈阳市东陵区', '东陵区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(474, now(), now(), NULL, '辽宁省沈阳市沈北新区', '沈北新区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(475, now(), now(), NULL, '辽宁省沈阳市于洪区', '于洪区', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(476, now(), now(), NULL, '辽宁省沈阳市辽中县', '辽中县', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(477, now(), now(), NULL, '辽宁省沈阳市康平县', '康平县', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(478, now(), now(), NULL, '辽宁省沈阳市法库县', '法库县', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(479, now(), now(), NULL, '辽宁省沈阳市新民市', '新民市', ',465,466,', 466);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(480, now(), now(), NULL, '辽宁省大连市', '大连市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(481, now(), now(), NULL, '辽宁省大连市中山区', '中山区', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(482, now(), now(), NULL, '辽宁省大连市西岗区', '西岗区', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(483, now(), now(), NULL, '辽宁省大连市沙河口区', '沙河口区', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(484, now(), now(), NULL, '辽宁省大连市甘井子区', '甘井子区', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(485, now(), now(), NULL, '辽宁省大连市旅顺口区', '旅顺口区', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(486, now(), now(), NULL, '辽宁省大连市金州区', '金州区', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(487, now(), now(), NULL, '辽宁省大连市长海县', '长海县', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(488, now(), now(), NULL, '辽宁省大连市瓦房店市', '瓦房店市', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(489, now(), now(), NULL, '辽宁省大连市普兰店市', '普兰店市', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(490, now(), now(), NULL, '辽宁省大连市庄河市', '庄河市', ',465,480,', 480);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(491, now(), now(), NULL, '辽宁省鞍山市', '鞍山市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(492, now(), now(), NULL, '辽宁省鞍山市铁东区', '铁东区', ',465,491,', 491);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(493, now(), now(), NULL, '辽宁省鞍山市铁西区', '铁西区', ',465,491,', 491);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(494, now(), now(), NULL, '辽宁省鞍山市立山区', '立山区', ',465,491,', 491);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(495, now(), now(), NULL, '辽宁省鞍山市千山区', '千山区', ',465,491,', 491);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(496, now(), now(), NULL, '辽宁省鞍山市台安县', '台安县', ',465,491,', 491);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(497, now(), now(), NULL, '辽宁省鞍山市岫岩满族自治县', '岫岩满族自治县', ',465,491,', 491);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(498, now(), now(), NULL, '辽宁省鞍山市海城市', '海城市', ',465,491,', 491);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(499, now(), now(), NULL, '辽宁省抚顺市', '抚顺市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(500, now(), now(), NULL, '辽宁省抚顺市新抚区', '新抚区', ',465,499,', 499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(501, now(), now(), NULL, '辽宁省抚顺市东洲区', '东洲区', ',465,499,', 499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(502, now(), now(), NULL, '辽宁省抚顺市望花区', '望花区', ',465,499,', 499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(503, now(), now(), NULL, '辽宁省抚顺市顺城区', '顺城区', ',465,499,', 499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(504, now(), now(), NULL, '辽宁省抚顺市抚顺县', '抚顺县', ',465,499,', 499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(505, now(), now(), NULL, '辽宁省抚顺市新宾满族自治县', '新宾满族自治县', ',465,499,', 499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(506, now(), now(), NULL, '辽宁省抚顺市清原满族自治县', '清原满族自治县', ',465,499,', 499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(507, now(), now(), NULL, '辽宁省本溪市', '本溪市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(508, now(), now(), NULL, '辽宁省本溪市平山区', '平山区', ',465,507,', 507);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(509, now(), now(), NULL, '辽宁省本溪市溪湖区', '溪湖区', ',465,507,', 507);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(510, now(), now(), NULL, '辽宁省本溪市明山区', '明山区', ',465,507,', 507);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(511, now(), now(), NULL, '辽宁省本溪市南芬区', '南芬区', ',465,507,', 507);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(512, now(), now(), NULL, '辽宁省本溪市本溪满族自治县', '本溪满族自治县', ',465,507,', 507);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(513, now(), now(), NULL, '辽宁省本溪市桓仁满族自治县', '桓仁满族自治县', ',465,507,', 507);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(514, now(), now(), NULL, '辽宁省丹东市', '丹东市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(515, now(), now(), NULL, '辽宁省丹东市元宝区', '元宝区', ',465,514,', 514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(516, now(), now(), NULL, '辽宁省丹东市振兴区', '振兴区', ',465,514,', 514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(517, now(), now(), NULL, '辽宁省丹东市振安区', '振安区', ',465,514,', 514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(518, now(), now(), NULL, '辽宁省丹东市宽甸满族自治县', '宽甸满族自治县', ',465,514,', 514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(519, now(), now(), NULL, '辽宁省丹东市东港市', '东港市', ',465,514,', 514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(520, now(), now(), NULL, '辽宁省丹东市凤城市', '凤城市', ',465,514,', 514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(521, now(), now(), NULL, '辽宁省锦州市', '锦州市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(522, now(), now(), NULL, '辽宁省锦州市古塔区', '古塔区', ',465,521,', 521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(523, now(), now(), NULL, '辽宁省锦州市凌河区', '凌河区', ',465,521,', 521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(524, now(), now(), NULL, '辽宁省锦州市太和区', '太和区', ',465,521,', 521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(525, now(), now(), NULL, '辽宁省锦州市黑山县', '黑山县', ',465,521,', 521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(526, now(), now(), NULL, '辽宁省锦州市义县', '义县', ',465,521,', 521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(527, now(), now(), NULL, '辽宁省锦州市凌海市', '凌海市', ',465,521,', 521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(528, now(), now(), NULL, '辽宁省锦州市北镇市', '北镇市', ',465,521,', 521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(529, now(), now(), NULL, '辽宁省营口市', '营口市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(530, now(), now(), NULL, '辽宁省营口市站前区', '站前区', ',465,529,', 529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(531, now(), now(), NULL, '辽宁省营口市西市区', '西市区', ',465,529,', 529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(532, now(), now(), NULL, '辽宁省营口市鲅鱼圈区', '鲅鱼圈区', ',465,529,', 529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(533, now(), now(), NULL, '辽宁省营口市老边区', '老边区', ',465,529,', 529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(534, now(), now(), NULL, '辽宁省营口市盖州市', '盖州市', ',465,529,', 529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(535, now(), now(), NULL, '辽宁省营口市大石桥市', '大石桥市', ',465,529,', 529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(536, now(), now(), NULL, '辽宁省阜新市', '阜新市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(537, now(), now(), NULL, '辽宁省阜新市海州区', '海州区', ',465,536,', 536);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(538, now(), now(), NULL, '辽宁省阜新市新邱区', '新邱区', ',465,536,', 536);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(539, now(), now(), NULL, '辽宁省阜新市太平区', '太平区', ',465,536,', 536);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(540, now(), now(), NULL, '辽宁省阜新市清河门区', '清河门区', ',465,536,', 536);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(541, now(), now(), NULL, '辽宁省阜新市细河区', '细河区', ',465,536,', 536);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(542, now(), now(), NULL, '辽宁省阜新市阜新蒙古族自治县', '阜新蒙古族自治县', ',465,536,', 536);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(543, now(), now(), NULL, '辽宁省阜新市彰武县', '彰武县', ',465,536,', 536);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(544, now(), now(), NULL, '辽宁省辽阳市', '辽阳市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(545, now(), now(), NULL, '辽宁省辽阳市白塔区', '白塔区', ',465,544,', 544);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(546, now(), now(), NULL, '辽宁省辽阳市文圣区', '文圣区', ',465,544,', 544);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(547, now(), now(), NULL, '辽宁省辽阳市宏伟区', '宏伟区', ',465,544,', 544);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(548, now(), now(), NULL, '辽宁省辽阳市弓长岭区', '弓长岭区', ',465,544,', 544);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(549, now(), now(), NULL, '辽宁省辽阳市太子河区', '太子河区', ',465,544,', 544);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(550, now(), now(), NULL, '辽宁省辽阳市辽阳县', '辽阳县', ',465,544,', 544);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(551, now(), now(), NULL, '辽宁省辽阳市灯塔市', '灯塔市', ',465,544,', 544);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(552, now(), now(), NULL, '辽宁省盘锦市', '盘锦市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(553, now(), now(), NULL, '辽宁省盘锦市双台子区', '双台子区', ',465,552,', 552);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(554, now(), now(), NULL, '辽宁省盘锦市兴隆台区', '兴隆台区', ',465,552,', 552);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(555, now(), now(), NULL, '辽宁省盘锦市大洼县', '大洼县', ',465,552,', 552);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(556, now(), now(), NULL, '辽宁省盘锦市盘山县', '盘山县', ',465,552,', 552);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(557, now(), now(), NULL, '辽宁省铁岭市', '铁岭市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(558, now(), now(), NULL, '辽宁省铁岭市银州区', '银州区', ',465,557,', 557);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(559, now(), now(), NULL, '辽宁省铁岭市清河区', '清河区', ',465,557,', 557);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(560, now(), now(), NULL, '辽宁省铁岭市铁岭县', '铁岭县', ',465,557,', 557);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(561, now(), now(), NULL, '辽宁省铁岭市西丰县', '西丰县', ',465,557,', 557);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(562, now(), now(), NULL, '辽宁省铁岭市昌图县', '昌图县', ',465,557,', 557);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(563, now(), now(), NULL, '辽宁省铁岭市调兵山市', '调兵山市', ',465,557,', 557);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(564, now(), now(), NULL, '辽宁省铁岭市开原市', '开原市', ',465,557,', 557);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(565, now(), now(), NULL, '辽宁省朝阳市', '朝阳市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(566, now(), now(), NULL, '辽宁省朝阳市双塔区', '双塔区', ',465,565,', 565);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(567, now(), now(), NULL, '辽宁省朝阳市龙城区', '龙城区', ',465,565,', 565);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(568, now(), now(), NULL, '辽宁省朝阳市朝阳县', '朝阳县', ',465,565,', 565);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(569, now(), now(), NULL, '辽宁省朝阳市建平县', '建平县', ',465,565,', 565);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(570, now(), now(), NULL, '辽宁省朝阳市喀喇沁左翼蒙古族自治县', '喀喇沁左翼蒙古族自治县', ',465,565,', 565);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(571, now(), now(), NULL, '辽宁省朝阳市北票市', '北票市', ',465,565,', 565);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(572, now(), now(), NULL, '辽宁省朝阳市凌源市', '凌源市', ',465,565,', 565);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(573, now(), now(), NULL, '辽宁省葫芦岛市', '葫芦岛市', ',465,', 465);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(574, now(), now(), NULL, '辽宁省葫芦岛市连山区', '连山区', ',465,573,', 573);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(575, now(), now(), NULL, '辽宁省葫芦岛市龙港区', '龙港区', ',465,573,', 573);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(576, now(), now(), NULL, '辽宁省葫芦岛市南票区', '南票区', ',465,573,', 573);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(577, now(), now(), NULL, '辽宁省葫芦岛市绥中县', '绥中县', ',465,573,', 573);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(578, now(), now(), NULL, '辽宁省葫芦岛市建昌县', '建昌县', ',465,573,', 573);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(579, now(), now(), NULL, '辽宁省葫芦岛市兴城市', '兴城市', ',465,573,', 573);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(580, now(), now(), NULL, '吉林省', '吉林省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(581, now(), now(), NULL, '吉林省长春市', '长春市', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(582, now(), now(), NULL, '吉林省长春市南关区', '南关区', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(583, now(), now(), NULL, '吉林省长春市宽城区', '宽城区', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(584, now(), now(), NULL, '吉林省长春市朝阳区', '朝阳区', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(585, now(), now(), NULL, '吉林省长春市二道区', '二道区', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(586, now(), now(), NULL, '吉林省长春市绿园区', '绿园区', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(587, now(), now(), NULL, '吉林省长春市双阳区', '双阳区', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(588, now(), now(), NULL, '吉林省长春市农安县', '农安县', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(589, now(), now(), NULL, '吉林省长春市九台市', '九台市', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(590, now(), now(), NULL, '吉林省长春市榆树市', '榆树市', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(591, now(), now(), NULL, '吉林省长春市德惠市', '德惠市', ',580,581,', 581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(592, now(), now(), NULL, '吉林省吉林市', '吉林市', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(593, now(), now(), NULL, '吉林省吉林市昌邑区', '昌邑区', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(594, now(), now(), NULL, '吉林省吉林市龙潭区', '龙潭区', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(595, now(), now(), NULL, '吉林省吉林市船营区', '船营区', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(596, now(), now(), NULL, '吉林省吉林市丰满区', '丰满区', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(597, now(), now(), NULL, '吉林省吉林市永吉县', '永吉县', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(598, now(), now(), NULL, '吉林省吉林市蛟河市', '蛟河市', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(599, now(), now(), NULL, '吉林省吉林市桦甸市', '桦甸市', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(600, now(), now(), NULL, '吉林省吉林市舒兰市', '舒兰市', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(601, now(), now(), NULL, '吉林省吉林市磐石市', '磐石市', ',580,592,', 592);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(602, now(), now(), NULL, '吉林省四平市', '四平市', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(603, now(), now(), NULL, '吉林省四平市铁西区', '铁西区', ',580,602,', 602);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(604, now(), now(), NULL, '吉林省四平市铁东区', '铁东区', ',580,602,', 602);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(605, now(), now(), NULL, '吉林省四平市梨树县', '梨树县', ',580,602,', 602);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(606, now(), now(), NULL, '吉林省四平市伊通满族自治县', '伊通满族自治县', ',580,602,', 602);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(607, now(), now(), NULL, '吉林省四平市公主岭市', '公主岭市', ',580,602,', 602);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(608, now(), now(), NULL, '吉林省四平市双辽市', '双辽市', ',580,602,', 602);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(609, now(), now(), NULL, '吉林省辽源市', '辽源市', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(610, now(), now(), NULL, '吉林省辽源市龙山区', '龙山区', ',580,609,', 609);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(611, now(), now(), NULL, '吉林省辽源市西安区', '西安区', ',580,609,', 609);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(612, now(), now(), NULL, '吉林省辽源市东丰县', '东丰县', ',580,609,', 609);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(613, now(), now(), NULL, '吉林省辽源市东辽县', '东辽县', ',580,609,', 609);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(614, now(), now(), NULL, '吉林省通化市', '通化市', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(615, now(), now(), NULL, '吉林省通化市东昌区', '东昌区', ',580,614,', 614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(616, now(), now(), NULL, '吉林省通化市二道江区', '二道江区', ',580,614,', 614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(617, now(), now(), NULL, '吉林省通化市通化县', '通化县', ',580,614,', 614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(618, now(), now(), NULL, '吉林省通化市辉南县', '辉南县', ',580,614,', 614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(619, now(), now(), NULL, '吉林省通化市柳河县', '柳河县', ',580,614,', 614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(620, now(), now(), NULL, '吉林省通化市梅河口市', '梅河口市', ',580,614,', 614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(621, now(), now(), NULL, '吉林省通化市集安市', '集安市', ',580,614,', 614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(622, now(), now(), NULL, '吉林省白山市', '白山市', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(623, now(), now(), NULL, '吉林省白山市浑江区', '浑江区', ',580,622,', 622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(624, now(), now(), NULL, '吉林省白山市江源区', '江源区', ',580,622,', 622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(625, now(), now(), NULL, '吉林省白山市抚松县', '抚松县', ',580,622,', 622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(626, now(), now(), NULL, '吉林省白山市靖宇县', '靖宇县', ',580,622,', 622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(627, now(), now(), NULL, '吉林省白山市长白朝鲜族自治县', '长白朝鲜族自治县', ',580,622,', 622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(628, now(), now(), NULL, '吉林省白山市临江市', '临江市', ',580,622,', 622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(629, now(), now(), NULL, '吉林省松原市', '松原市', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(630, now(), now(), NULL, '吉林省松原市宁江区', '宁江区', ',580,629,', 629);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(631, now(), now(), NULL, '吉林省松原市前郭尔罗斯蒙古族自治县', '前郭尔罗斯蒙古族自治县', ',580,629,', 629);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(632, now(), now(), NULL, '吉林省松原市长岭县', '长岭县', ',580,629,', 629);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(633, now(), now(), NULL, '吉林省松原市乾安县', '乾安县', ',580,629,', 629);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(634, now(), now(), NULL, '吉林省松原市扶余县', '扶余县', ',580,629,', 629);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(635, now(), now(), NULL, '吉林省白城市', '白城市', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(636, now(), now(), NULL, '吉林省白城市洮北区', '洮北区', ',580,635,', 635);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(637, now(), now(), NULL, '吉林省白城市镇赉县', '镇赉县', ',580,635,', 635);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(638, now(), now(), NULL, '吉林省白城市通榆县', '通榆县', ',580,635,', 635);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(639, now(), now(), NULL, '吉林省白城市洮南市', '洮南市', ',580,635,', 635);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(640, now(), now(), NULL, '吉林省白城市大安市', '大安市', ',580,635,', 635);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(641, now(), now(), NULL, '吉林省延边朝鲜族自治州', '延边朝鲜族自治州', ',580,', 580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(642, now(), now(), NULL, '吉林省延边朝鲜族自治州延吉市', '延吉市', ',580,641,', 641);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(643, now(), now(), NULL, '吉林省延边朝鲜族自治州图们市', '图们市', ',580,641,', 641);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(644, now(), now(), NULL, '吉林省延边朝鲜族自治州敦化市', '敦化市', ',580,641,', 641);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(645, now(), now(), NULL, '吉林省延边朝鲜族自治州珲春市', '珲春市', ',580,641,', 641);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(646, now(), now(), NULL, '吉林省延边朝鲜族自治州龙井市', '龙井市', ',580,641,', 641);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(647, now(), now(), NULL, '吉林省延边朝鲜族自治州和龙市', '和龙市', ',580,641,', 641);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(648, now(), now(), NULL, '吉林省延边朝鲜族自治州汪清县', '汪清县', ',580,641,', 641);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(649, now(), now(), NULL, '吉林省延边朝鲜族自治州安图县', '安图县', ',580,641,', 641);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(650, now(), now(), NULL, '黑龙江省', '黑龙江省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(651, now(), now(), NULL, '黑龙江省哈尔滨市', '哈尔滨市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(652, now(), now(), NULL, '黑龙江省哈尔滨市道里区', '道里区', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(653, now(), now(), NULL, '黑龙江省哈尔滨市南岗区', '南岗区', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(654, now(), now(), NULL, '黑龙江省哈尔滨市道外区', '道外区', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(655, now(), now(), NULL, '黑龙江省哈尔滨市平房区', '平房区', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(656, now(), now(), NULL, '黑龙江省哈尔滨市松北区', '松北区', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(657, now(), now(), NULL, '黑龙江省哈尔滨市香坊区', '香坊区', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(658, now(), now(), NULL, '黑龙江省哈尔滨市呼兰区', '呼兰区', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(659, now(), now(), NULL, '黑龙江省哈尔滨市阿城区', '阿城区', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(660, now(), now(), NULL, '黑龙江省哈尔滨市依兰县', '依兰县', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(661, now(), now(), NULL, '黑龙江省哈尔滨市方正县', '方正县', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(662, now(), now(), NULL, '黑龙江省哈尔滨市宾县', '宾县', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(663, now(), now(), NULL, '黑龙江省哈尔滨市巴彦县', '巴彦县', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(664, now(), now(), NULL, '黑龙江省哈尔滨市木兰县', '木兰县', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(665, now(), now(), NULL, '黑龙江省哈尔滨市通河县', '通河县', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(666, now(), now(), NULL, '黑龙江省哈尔滨市延寿县', '延寿县', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(667, now(), now(), NULL, '黑龙江省哈尔滨市双城市', '双城市', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(668, now(), now(), NULL, '黑龙江省哈尔滨市尚志市', '尚志市', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(669, now(), now(), NULL, '黑龙江省哈尔滨市五常市', '五常市', ',650,651,', 651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(670, now(), now(), NULL, '黑龙江省齐齐哈尔市', '齐齐哈尔市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(671, now(), now(), NULL, '黑龙江省齐齐哈尔市龙沙区', '龙沙区', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(672, now(), now(), NULL, '黑龙江省齐齐哈尔市建华区', '建华区', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(673, now(), now(), NULL, '黑龙江省齐齐哈尔市铁锋区', '铁锋区', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(674, now(), now(), NULL, '黑龙江省齐齐哈尔市昂昂溪区', '昂昂溪区', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(675, now(), now(), NULL, '黑龙江省齐齐哈尔市富拉尔基区', '富拉尔基区', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(676, now(), now(), NULL, '黑龙江省齐齐哈尔市碾子山区', '碾子山区', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(677, now(), now(), NULL, '黑龙江省齐齐哈尔市梅里斯达斡尔族区', '梅里斯达斡尔族区', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(678, now(), now(), NULL, '黑龙江省齐齐哈尔市龙江县', '龙江县', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(679, now(), now(), NULL, '黑龙江省齐齐哈尔市依安县', '依安县', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(680, now(), now(), NULL, '黑龙江省齐齐哈尔市泰来县', '泰来县', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(681, now(), now(), NULL, '黑龙江省齐齐哈尔市甘南县', '甘南县', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(682, now(), now(), NULL, '黑龙江省齐齐哈尔市富裕县', '富裕县', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(683, now(), now(), NULL, '黑龙江省齐齐哈尔市克山县', '克山县', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(684, now(), now(), NULL, '黑龙江省齐齐哈尔市克东县', '克东县', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(685, now(), now(), NULL, '黑龙江省齐齐哈尔市拜泉县', '拜泉县', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(686, now(), now(), NULL, '黑龙江省齐齐哈尔市讷河市', '讷河市', ',650,670,', 670);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(687, now(), now(), NULL, '黑龙江省鸡西市', '鸡西市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(688, now(), now(), NULL, '黑龙江省鸡西市鸡冠区', '鸡冠区', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(689, now(), now(), NULL, '黑龙江省鸡西市恒山区', '恒山区', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(690, now(), now(), NULL, '黑龙江省鸡西市滴道区', '滴道区', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(691, now(), now(), NULL, '黑龙江省鸡西市梨树区', '梨树区', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(692, now(), now(), NULL, '黑龙江省鸡西市城子河区', '城子河区', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(693, now(), now(), NULL, '黑龙江省鸡西市麻山区', '麻山区', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(694, now(), now(), NULL, '黑龙江省鸡西市鸡东县', '鸡东县', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(695, now(), now(), NULL, '黑龙江省鸡西市虎林市', '虎林市', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(696, now(), now(), NULL, '黑龙江省鸡西市密山市', '密山市', ',650,687,', 687);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(697, now(), now(), NULL, '黑龙江省鹤岗市', '鹤岗市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(698, now(), now(), NULL, '黑龙江省鹤岗市向阳区', '向阳区', ',650,697,', 697);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(699, now(), now(), NULL, '黑龙江省鹤岗市工农区', '工农区', ',650,697,', 697);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(700, now(), now(), NULL, '黑龙江省鹤岗市南山区', '南山区', ',650,697,', 697);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(701, now(), now(), NULL, '黑龙江省鹤岗市兴安区', '兴安区', ',650,697,', 697);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(702, now(), now(), NULL, '黑龙江省鹤岗市东山区', '东山区', ',650,697,', 697);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(703, now(), now(), NULL, '黑龙江省鹤岗市兴山区', '兴山区', ',650,697,', 697);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(704, now(), now(), NULL, '黑龙江省鹤岗市萝北县', '萝北县', ',650,697,', 697);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(705, now(), now(), NULL, '黑龙江省鹤岗市绥滨县', '绥滨县', ',650,697,', 697);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(706, now(), now(), NULL, '黑龙江省双鸭山市', '双鸭山市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(707, now(), now(), NULL, '黑龙江省双鸭山市尖山区', '尖山区', ',650,706,', 706);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(708, now(), now(), NULL, '黑龙江省双鸭山市岭东区', '岭东区', ',650,706,', 706);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(709, now(), now(), NULL, '黑龙江省双鸭山市四方台区', '四方台区', ',650,706,', 706);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(710, now(), now(), NULL, '黑龙江省双鸭山市宝山区', '宝山区', ',650,706,', 706);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(711, now(), now(), NULL, '黑龙江省双鸭山市集贤县', '集贤县', ',650,706,', 706);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(712, now(), now(), NULL, '黑龙江省双鸭山市友谊县', '友谊县', ',650,706,', 706);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(713, now(), now(), NULL, '黑龙江省双鸭山市宝清县', '宝清县', ',650,706,', 706);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(714, now(), now(), NULL, '黑龙江省双鸭山市饶河县', '饶河县', ',650,706,', 706);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(715, now(), now(), NULL, '黑龙江省大庆市', '大庆市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(716, now(), now(), NULL, '黑龙江省大庆市萨尔图区', '萨尔图区', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(717, now(), now(), NULL, '黑龙江省大庆市龙凤区', '龙凤区', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(718, now(), now(), NULL, '黑龙江省大庆市让胡路区', '让胡路区', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(719, now(), now(), NULL, '黑龙江省大庆市红岗区', '红岗区', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(720, now(), now(), NULL, '黑龙江省大庆市大同区', '大同区', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(721, now(), now(), NULL, '黑龙江省大庆市肇州县', '肇州县', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(722, now(), now(), NULL, '黑龙江省大庆市肇源县', '肇源县', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(723, now(), now(), NULL, '黑龙江省大庆市林甸县', '林甸县', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(724, now(), now(), NULL, '黑龙江省大庆市杜尔伯特蒙古族自治县', '杜尔伯特蒙古族自治县', ',650,715,', 715);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(725, now(), now(), NULL, '黑龙江省伊春市', '伊春市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(726, now(), now(), NULL, '黑龙江省伊春市伊春区', '伊春区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(727, now(), now(), NULL, '黑龙江省伊春市南岔区', '南岔区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(728, now(), now(), NULL, '黑龙江省伊春市友好区', '友好区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(729, now(), now(), NULL, '黑龙江省伊春市西林区', '西林区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(730, now(), now(), NULL, '黑龙江省伊春市翠峦区', '翠峦区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(731, now(), now(), NULL, '黑龙江省伊春市新青区', '新青区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(732, now(), now(), NULL, '黑龙江省伊春市美溪区', '美溪区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(733, now(), now(), NULL, '黑龙江省伊春市金山屯区', '金山屯区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(734, now(), now(), NULL, '黑龙江省伊春市五营区', '五营区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(735, now(), now(), NULL, '黑龙江省伊春市乌马河区', '乌马河区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(736, now(), now(), NULL, '黑龙江省伊春市汤旺河区', '汤旺河区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(737, now(), now(), NULL, '黑龙江省伊春市带岭区', '带岭区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(738, now(), now(), NULL, '黑龙江省伊春市乌伊岭区', '乌伊岭区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(739, now(), now(), NULL, '黑龙江省伊春市红星区', '红星区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(740, now(), now(), NULL, '黑龙江省伊春市上甘岭区', '上甘岭区', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(741, now(), now(), NULL, '黑龙江省伊春市嘉荫县', '嘉荫县', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(742, now(), now(), NULL, '黑龙江省伊春市铁力市', '铁力市', ',650,725,', 725);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(743, now(), now(), NULL, '黑龙江省佳木斯市', '佳木斯市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(744, now(), now(), NULL, '黑龙江省佳木斯市向阳区', '向阳区', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(745, now(), now(), NULL, '黑龙江省佳木斯市前进区', '前进区', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(746, now(), now(), NULL, '黑龙江省佳木斯市东风区', '东风区', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(747, now(), now(), NULL, '黑龙江省佳木斯市郊区', '郊区', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(748, now(), now(), NULL, '黑龙江省佳木斯市桦南县', '桦南县', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(749, now(), now(), NULL, '黑龙江省佳木斯市桦川县', '桦川县', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(750, now(), now(), NULL, '黑龙江省佳木斯市汤原县', '汤原县', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(751, now(), now(), NULL, '黑龙江省佳木斯市抚远县', '抚远县', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(752, now(), now(), NULL, '黑龙江省佳木斯市同江市', '同江市', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(753, now(), now(), NULL, '黑龙江省佳木斯市富锦市', '富锦市', ',650,743,', 743);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(754, now(), now(), NULL, '黑龙江省七台河市', '七台河市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(755, now(), now(), NULL, '黑龙江省七台河市新兴区', '新兴区', ',650,754,', 754);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(756, now(), now(), NULL, '黑龙江省七台河市桃山区', '桃山区', ',650,754,', 754);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(757, now(), now(), NULL, '黑龙江省七台河市茄子河区', '茄子河区', ',650,754,', 754);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(758, now(), now(), NULL, '黑龙江省七台河市勃利县', '勃利县', ',650,754,', 754);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(759, now(), now(), NULL, '黑龙江省牡丹江市', '牡丹江市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(760, now(), now(), NULL, '黑龙江省牡丹江市东安区', '东安区', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(761, now(), now(), NULL, '黑龙江省牡丹江市阳明区', '阳明区', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(762, now(), now(), NULL, '黑龙江省牡丹江市爱民区', '爱民区', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(763, now(), now(), NULL, '黑龙江省牡丹江市西安区', '西安区', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(764, now(), now(), NULL, '黑龙江省牡丹江市东宁县', '东宁县', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(765, now(), now(), NULL, '黑龙江省牡丹江市林口县', '林口县', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(766, now(), now(), NULL, '黑龙江省牡丹江市绥芬河市', '绥芬河市', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(767, now(), now(), NULL, '黑龙江省牡丹江市海林市', '海林市', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(768, now(), now(), NULL, '黑龙江省牡丹江市宁安市', '宁安市', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(769, now(), now(), NULL, '黑龙江省牡丹江市穆棱市', '穆棱市', ',650,759,', 759);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(770, now(), now(), NULL, '黑龙江省黑河市', '黑河市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(771, now(), now(), NULL, '黑龙江省黑河市爱辉区', '爱辉区', ',650,770,', 770);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(772, now(), now(), NULL, '黑龙江省黑河市嫩江县', '嫩江县', ',650,770,', 770);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(773, now(), now(), NULL, '黑龙江省黑河市逊克县', '逊克县', ',650,770,', 770);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(774, now(), now(), NULL, '黑龙江省黑河市孙吴县', '孙吴县', ',650,770,', 770);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(775, now(), now(), NULL, '黑龙江省黑河市北安市', '北安市', ',650,770,', 770);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(776, now(), now(), NULL, '黑龙江省黑河市五大连池市', '五大连池市', ',650,770,', 770);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(777, now(), now(), NULL, '黑龙江省绥化市', '绥化市', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(778, now(), now(), NULL, '黑龙江省绥化市北林区', '北林区', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(779, now(), now(), NULL, '黑龙江省绥化市望奎县', '望奎县', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(780, now(), now(), NULL, '黑龙江省绥化市兰西县', '兰西县', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(781, now(), now(), NULL, '黑龙江省绥化市青冈县', '青冈县', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(782, now(), now(), NULL, '黑龙江省绥化市庆安县', '庆安县', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(783, now(), now(), NULL, '黑龙江省绥化市明水县', '明水县', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(784, now(), now(), NULL, '黑龙江省绥化市绥棱县', '绥棱县', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(785, now(), now(), NULL, '黑龙江省绥化市安达市', '安达市', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(786, now(), now(), NULL, '黑龙江省绥化市肇东市', '肇东市', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(787, now(), now(), NULL, '黑龙江省绥化市海伦市', '海伦市', ',650,777,', 777);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(788, now(), now(), NULL, '黑龙江省大兴安岭地区', '大兴安岭地区', ',650,', 650);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(789, now(), now(), NULL, '黑龙江省大兴安岭地区呼玛县', '呼玛县', ',650,788,', 788);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(790, now(), now(), NULL, '黑龙江省大兴安岭地区塔河县', '塔河县', ',650,788,', 788);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(791, now(), now(), NULL, '黑龙江省大兴安岭地区漠河县', '漠河县', ',650,788,', 788);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(792, now(), now(), NULL, '上海市', '上海市', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(793, now(), now(), NULL, '上海市黄浦区', '黄浦区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(794, now(), now(), NULL, '上海市徐汇区', '徐汇区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(795, now(), now(), NULL, '上海市长宁区', '长宁区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(796, now(), now(), NULL, '上海市静安区', '静安区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(797, now(), now(), NULL, '上海市普陀区', '普陀区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(798, now(), now(), NULL, '上海市闸北区', '闸北区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(799, now(), now(), NULL, '上海市虹口区', '虹口区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(800, now(), now(), NULL, '上海市杨浦区', '杨浦区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(801, now(), now(), NULL, '上海市闵行区', '闵行区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(802, now(), now(), NULL, '上海市宝山区', '宝山区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(803, now(), now(), NULL, '上海市嘉定区', '嘉定区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(804, now(), now(), NULL, '上海市浦东新区', '浦东新区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(805, now(), now(), NULL, '上海市金山区', '金山区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(806, now(), now(), NULL, '上海市松江区', '松江区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(807, now(), now(), NULL, '上海市青浦区', '青浦区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(808, now(), now(), NULL, '上海市奉贤区', '奉贤区', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(809, now(), now(), NULL, '上海市崇明县', '崇明县', ',792,', 792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(810, now(), now(), NULL, '江苏省', '江苏省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(811, now(), now(), NULL, '江苏省南京市', '南京市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(812, now(), now(), NULL, '江苏省南京市玄武区', '玄武区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(813, now(), now(), NULL, '江苏省南京市白下区', '白下区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(814, now(), now(), NULL, '江苏省南京市秦淮区', '秦淮区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(815, now(), now(), NULL, '江苏省南京市建邺区', '建邺区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(816, now(), now(), NULL, '江苏省南京市鼓楼区', '鼓楼区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(817, now(), now(), NULL, '江苏省南京市下关区', '下关区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(818, now(), now(), NULL, '江苏省南京市浦口区', '浦口区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(819, now(), now(), NULL, '江苏省南京市栖霞区', '栖霞区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(820, now(), now(), NULL, '江苏省南京市雨花台区', '雨花台区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(821, now(), now(), NULL, '江苏省南京市江宁区', '江宁区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(822, now(), now(), NULL, '江苏省南京市六合区', '六合区', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(823, now(), now(), NULL, '江苏省南京市溧水县', '溧水县', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(824, now(), now(), NULL, '江苏省南京市高淳县', '高淳县', ',810,811,', 811);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(825, now(), now(), NULL, '江苏省无锡市', '无锡市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(826, now(), now(), NULL, '江苏省无锡市崇安区', '崇安区', ',810,825,', 825);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(827, now(), now(), NULL, '江苏省无锡市南长区', '南长区', ',810,825,', 825);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(828, now(), now(), NULL, '江苏省无锡市北塘区', '北塘区', ',810,825,', 825);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(829, now(), now(), NULL, '江苏省无锡市锡山区', '锡山区', ',810,825,', 825);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(830, now(), now(), NULL, '江苏省无锡市惠山区', '惠山区', ',810,825,', 825);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(831, now(), now(), NULL, '江苏省无锡市滨湖区', '滨湖区', ',810,825,', 825);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(832, now(), now(), NULL, '江苏省无锡市江阴市', '江阴市', ',810,825,', 825);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(833, now(), now(), NULL, '江苏省无锡市宜兴市', '宜兴市', ',810,825,', 825);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(834, now(), now(), NULL, '江苏省徐州市', '徐州市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(835, now(), now(), NULL, '江苏省徐州市鼓楼区', '鼓楼区', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(836, now(), now(), NULL, '江苏省徐州市云龙区', '云龙区', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(837, now(), now(), NULL, '江苏省徐州市贾汪区', '贾汪区', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(838, now(), now(), NULL, '江苏省徐州市泉山区', '泉山区', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(839, now(), now(), NULL, '江苏省徐州市铜山区', '铜山区', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(840, now(), now(), NULL, '江苏省徐州市丰县', '丰县', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(841, now(), now(), NULL, '江苏省徐州市沛县', '沛县', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(842, now(), now(), NULL, '江苏省徐州市睢宁县', '睢宁县', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(843, now(), now(), NULL, '江苏省徐州市新沂市', '新沂市', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(844, now(), now(), NULL, '江苏省徐州市邳州市', '邳州市', ',810,834,', 834);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(845, now(), now(), NULL, '江苏省常州市', '常州市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(846, now(), now(), NULL, '江苏省常州市天宁区', '天宁区', ',810,845,', 845);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(847, now(), now(), NULL, '江苏省常州市钟楼区', '钟楼区', ',810,845,', 845);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(848, now(), now(), NULL, '江苏省常州市戚墅堰区', '戚墅堰区', ',810,845,', 845);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(849, now(), now(), NULL, '江苏省常州市新北区', '新北区', ',810,845,', 845);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(850, now(), now(), NULL, '江苏省常州市武进区', '武进区', ',810,845,', 845);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(851, now(), now(), NULL, '江苏省常州市溧阳市', '溧阳市', ',810,845,', 845);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(852, now(), now(), NULL, '江苏省常州市金坛市', '金坛市', ',810,845,', 845);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(853, now(), now(), NULL, '江苏省苏州市', '苏州市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(854, now(), now(), NULL, '江苏省苏州市虎丘区', '虎丘区', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(855, now(), now(), NULL, '江苏省苏州市吴中区', '吴中区', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(856, now(), now(), NULL, '江苏省苏州市相城区', '相城区', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(857, now(), now(), NULL, '江苏省苏州市姑苏区', '姑苏区', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(858, now(), now(), NULL, '江苏省苏州市吴江区', '吴江区', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(859, now(), now(), NULL, '江苏省苏州市常熟市', '常熟市', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(860, now(), now(), NULL, '江苏省苏州市张家港市', '张家港市', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(861, now(), now(), NULL, '江苏省苏州市昆山市', '昆山市', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(862, now(), now(), NULL, '江苏省苏州市太仓市', '太仓市', ',810,853,', 853);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(863, now(), now(), NULL, '江苏省南通市', '南通市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(864, now(), now(), NULL, '江苏省南通市崇川区', '崇川区', ',810,863,', 863);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(865, now(), now(), NULL, '江苏省南通市港闸区', '港闸区', ',810,863,', 863);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(866, now(), now(), NULL, '江苏省南通市通州区', '通州区', ',810,863,', 863);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(867, now(), now(), NULL, '江苏省南通市海安县', '海安县', ',810,863,', 863);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(868, now(), now(), NULL, '江苏省南通市如东县', '如东县', ',810,863,', 863);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(869, now(), now(), NULL, '江苏省南通市启东市', '启东市', ',810,863,', 863);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(870, now(), now(), NULL, '江苏省南通市如皋市', '如皋市', ',810,863,', 863);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(871, now(), now(), NULL, '江苏省南通市海门市', '海门市', ',810,863,', 863);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(872, now(), now(), NULL, '江苏省连云港市', '连云港市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(873, now(), now(), NULL, '江苏省连云港市连云区', '连云区', ',810,872,', 872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(874, now(), now(), NULL, '江苏省连云港市新浦区', '新浦区', ',810,872,', 872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(875, now(), now(), NULL, '江苏省连云港市海州区', '海州区', ',810,872,', 872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(876, now(), now(), NULL, '江苏省连云港市赣榆县', '赣榆县', ',810,872,', 872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(877, now(), now(), NULL, '江苏省连云港市东海县', '东海县', ',810,872,', 872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(878, now(), now(), NULL, '江苏省连云港市灌云县', '灌云县', ',810,872,', 872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(879, now(), now(), NULL, '江苏省连云港市灌南县', '灌南县', ',810,872,', 872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(880, now(), now(), NULL, '江苏省淮安市', '淮安市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(881, now(), now(), NULL, '江苏省淮安市清河区', '清河区', ',810,880,', 880);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(882, now(), now(), NULL, '江苏省淮安市淮安区', '淮安区', ',810,880,', 880);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(883, now(), now(), NULL, '江苏省淮安市淮阴区', '淮阴区', ',810,880,', 880);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(884, now(), now(), NULL, '江苏省淮安市清浦区', '清浦区', ',810,880,', 880);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(885, now(), now(), NULL, '江苏省淮安市涟水县', '涟水县', ',810,880,', 880);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(886, now(), now(), NULL, '江苏省淮安市洪泽县', '洪泽县', ',810,880,', 880);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(887, now(), now(), NULL, '江苏省淮安市盱眙县', '盱眙县', ',810,880,', 880);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(888, now(), now(), NULL, '江苏省淮安市金湖县', '金湖县', ',810,880,', 880);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(889, now(), now(), NULL, '江苏省盐城市', '盐城市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(890, now(), now(), NULL, '江苏省盐城市亭湖区', '亭湖区', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(891, now(), now(), NULL, '江苏省盐城市盐都区', '盐都区', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(892, now(), now(), NULL, '江苏省盐城市响水县', '响水县', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(893, now(), now(), NULL, '江苏省盐城市滨海县', '滨海县', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(894, now(), now(), NULL, '江苏省盐城市阜宁县', '阜宁县', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(895, now(), now(), NULL, '江苏省盐城市射阳县', '射阳县', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(896, now(), now(), NULL, '江苏省盐城市建湖县', '建湖县', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(897, now(), now(), NULL, '江苏省盐城市东台市', '东台市', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(898, now(), now(), NULL, '江苏省盐城市大丰市', '大丰市', ',810,889,', 889);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(899, now(), now(), NULL, '江苏省扬州市', '扬州市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(900, now(), now(), NULL, '江苏省扬州市广陵区', '广陵区', ',810,899,', 899);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(901, now(), now(), NULL, '江苏省扬州市邗江区', '邗江区', ',810,899,', 899);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(902, now(), now(), NULL, '江苏省扬州市江都区', '江都区', ',810,899,', 899);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(903, now(), now(), NULL, '江苏省扬州市宝应县', '宝应县', ',810,899,', 899);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(904, now(), now(), NULL, '江苏省扬州市仪征市', '仪征市', ',810,899,', 899);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(905, now(), now(), NULL, '江苏省扬州市高邮市', '高邮市', ',810,899,', 899);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(906, now(), now(), NULL, '江苏省镇江市', '镇江市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(907, now(), now(), NULL, '江苏省镇江市京口区', '京口区', ',810,906,', 906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(908, now(), now(), NULL, '江苏省镇江市润州区', '润州区', ',810,906,', 906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(909, now(), now(), NULL, '江苏省镇江市丹徒区', '丹徒区', ',810,906,', 906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(910, now(), now(), NULL, '江苏省镇江市丹阳市', '丹阳市', ',810,906,', 906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(911, now(), now(), NULL, '江苏省镇江市扬中市', '扬中市', ',810,906,', 906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(912, now(), now(), NULL, '江苏省镇江市句容市', '句容市', ',810,906,', 906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(913, now(), now(), NULL, '江苏省泰州市', '泰州市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(914, now(), now(), NULL, '江苏省泰州市海陵区', '海陵区', ',810,913,', 913);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(915, now(), now(), NULL, '江苏省泰州市高港区', '高港区', ',810,913,', 913);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(916, now(), now(), NULL, '江苏省泰州市兴化市', '兴化市', ',810,913,', 913);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(917, now(), now(), NULL, '江苏省泰州市靖江市', '靖江市', ',810,913,', 913);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(918, now(), now(), NULL, '江苏省泰州市泰兴市', '泰兴市', ',810,913,', 913);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(919, now(), now(), NULL, '江苏省泰州市姜堰市', '姜堰市', ',810,913,', 913);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(920, now(), now(), NULL, '江苏省宿迁市', '宿迁市', ',810,', 810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(921, now(), now(), NULL, '江苏省宿迁市宿城区', '宿城区', ',810,920,', 920);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(922, now(), now(), NULL, '江苏省宿迁市宿豫区', '宿豫区', ',810,920,', 920);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(923, now(), now(), NULL, '江苏省宿迁市沭阳县', '沭阳县', ',810,920,', 920);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(924, now(), now(), NULL, '江苏省宿迁市泗阳县', '泗阳县', ',810,920,', 920);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(925, now(), now(), NULL, '江苏省宿迁市泗洪县', '泗洪县', ',810,920,', 920);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(926, now(), now(), NULL, '浙江省', '浙江省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(927, now(), now(), NULL, '浙江省杭州市', '杭州市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(928, now(), now(), NULL, '浙江省杭州市上城区', '上城区', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(929, now(), now(), NULL, '浙江省杭州市下城区', '下城区', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(930, now(), now(), NULL, '浙江省杭州市江干区', '江干区', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(931, now(), now(), NULL, '浙江省杭州市拱墅区', '拱墅区', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(932, now(), now(), NULL, '浙江省杭州市西湖区', '西湖区', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(933, now(), now(), NULL, '浙江省杭州市滨江区', '滨江区', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(934, now(), now(), NULL, '浙江省杭州市萧山区', '萧山区', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(935, now(), now(), NULL, '浙江省杭州市余杭区', '余杭区', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(936, now(), now(), NULL, '浙江省杭州市桐庐县', '桐庐县', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(937, now(), now(), NULL, '浙江省杭州市淳安县', '淳安县', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(938, now(), now(), NULL, '浙江省杭州市建德市', '建德市', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(939, now(), now(), NULL, '浙江省杭州市富阳市', '富阳市', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(940, now(), now(), NULL, '浙江省杭州市临安市', '临安市', ',926,927,', 927);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(941, now(), now(), NULL, '浙江省宁波市', '宁波市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(942, now(), now(), NULL, '浙江省宁波市海曙区', '海曙区', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(943, now(), now(), NULL, '浙江省宁波市江东区', '江东区', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(944, now(), now(), NULL, '浙江省宁波市江北区', '江北区', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(945, now(), now(), NULL, '浙江省宁波市北仑区', '北仑区', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(946, now(), now(), NULL, '浙江省宁波市镇海区', '镇海区', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(947, now(), now(), NULL, '浙江省宁波市鄞州区', '鄞州区', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(948, now(), now(), NULL, '浙江省宁波市象山县', '象山县', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(949, now(), now(), NULL, '浙江省宁波市宁海县', '宁海县', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(950, now(), now(), NULL, '浙江省宁波市余姚市', '余姚市', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(951, now(), now(), NULL, '浙江省宁波市慈溪市', '慈溪市', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(952, now(), now(), NULL, '浙江省宁波市奉化市', '奉化市', ',926,941,', 941);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(953, now(), now(), NULL, '浙江省温州市', '温州市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(954, now(), now(), NULL, '浙江省温州市鹿城区', '鹿城区', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(955, now(), now(), NULL, '浙江省温州市龙湾区', '龙湾区', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(956, now(), now(), NULL, '浙江省温州市瓯海区', '瓯海区', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(957, now(), now(), NULL, '浙江省温州市洞头县', '洞头县', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(958, now(), now(), NULL, '浙江省温州市永嘉县', '永嘉县', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(959, now(), now(), NULL, '浙江省温州市平阳县', '平阳县', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(960, now(), now(), NULL, '浙江省温州市苍南县', '苍南县', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(961, now(), now(), NULL, '浙江省温州市文成县', '文成县', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(962, now(), now(), NULL, '浙江省温州市泰顺县', '泰顺县', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(963, now(), now(), NULL, '浙江省温州市瑞安市', '瑞安市', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(964, now(), now(), NULL, '浙江省温州市乐清市', '乐清市', ',926,953,', 953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(965, now(), now(), NULL, '浙江省嘉兴市', '嘉兴市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(966, now(), now(), NULL, '浙江省嘉兴市南湖区', '南湖区', ',926,965,', 965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(967, now(), now(), NULL, '浙江省嘉兴市秀洲区', '秀洲区', ',926,965,', 965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(968, now(), now(), NULL, '浙江省嘉兴市嘉善县', '嘉善县', ',926,965,', 965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(969, now(), now(), NULL, '浙江省嘉兴市海盐县', '海盐县', ',926,965,', 965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(970, now(), now(), NULL, '浙江省嘉兴市海宁市', '海宁市', ',926,965,', 965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(971, now(), now(), NULL, '浙江省嘉兴市平湖市', '平湖市', ',926,965,', 965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(972, now(), now(), NULL, '浙江省嘉兴市桐乡市', '桐乡市', ',926,965,', 965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(973, now(), now(), NULL, '浙江省湖州市', '湖州市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(974, now(), now(), NULL, '浙江省湖州市吴兴区', '吴兴区', ',926,973,', 973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(975, now(), now(), NULL, '浙江省湖州市南浔区', '南浔区', ',926,973,', 973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(976, now(), now(), NULL, '浙江省湖州市德清县', '德清县', ',926,973,', 973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(977, now(), now(), NULL, '浙江省湖州市长兴县', '长兴县', ',926,973,', 973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(978, now(), now(), NULL, '浙江省湖州市安吉县', '安吉县', ',926,973,', 973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(979, now(), now(), NULL, '浙江省绍兴市', '绍兴市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(980, now(), now(), NULL, '浙江省绍兴市越城区', '越城区', ',926,979,', 979);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(981, now(), now(), NULL, '浙江省绍兴市绍兴县', '绍兴县', ',926,979,', 979);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(982, now(), now(), NULL, '浙江省绍兴市新昌县', '新昌县', ',926,979,', 979);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(983, now(), now(), NULL, '浙江省绍兴市诸暨市', '诸暨市', ',926,979,', 979);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(984, now(), now(), NULL, '浙江省绍兴市上虞市', '上虞市', ',926,979,', 979);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(985, now(), now(), NULL, '浙江省绍兴市嵊州市', '嵊州市', ',926,979,', 979);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(986, now(), now(), NULL, '浙江省金华市', '金华市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(987, now(), now(), NULL, '浙江省金华市婺城区', '婺城区', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(988, now(), now(), NULL, '浙江省金华市金东区', '金东区', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(989, now(), now(), NULL, '浙江省金华市武义县', '武义县', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(990, now(), now(), NULL, '浙江省金华市浦江县', '浦江县', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(991, now(), now(), NULL, '浙江省金华市磐安县', '磐安县', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(992, now(), now(), NULL, '浙江省金华市兰溪市', '兰溪市', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(993, now(), now(), NULL, '浙江省金华市义乌市', '义乌市', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(994, now(), now(), NULL, '浙江省金华市东阳市', '东阳市', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(995, now(), now(), NULL, '浙江省金华市永康市', '永康市', ',926,986,', 986);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(996, now(), now(), NULL, '浙江省衢州市', '衢州市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(997, now(), now(), NULL, '浙江省衢州市柯城区', '柯城区', ',926,996,', 996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(998, now(), now(), NULL, '浙江省衢州市衢江区', '衢江区', ',926,996,', 996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(999, now(), now(), NULL, '浙江省衢州市常山县', '常山县', ',926,996,', 996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1000, now(), now(), NULL, '浙江省衢州市开化县', '开化县', ',926,996,', 996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1001, now(), now(), NULL, '浙江省衢州市龙游县', '龙游县', ',926,996,', 996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1002, now(), now(), NULL, '浙江省衢州市江山市', '江山市', ',926,996,', 996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1003, now(), now(), NULL, '浙江省舟山市', '舟山市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1004, now(), now(), NULL, '浙江省舟山市定海区', '定海区', ',926,1003,', 1003);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1005, now(), now(), NULL, '浙江省舟山市普陀区', '普陀区', ',926,1003,', 1003);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1006, now(), now(), NULL, '浙江省舟山市岱山县', '岱山县', ',926,1003,', 1003);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1007, now(), now(), NULL, '浙江省舟山市嵊泗县', '嵊泗县', ',926,1003,', 1003);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1008, now(), now(), NULL, '浙江省台州市', '台州市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1009, now(), now(), NULL, '浙江省台州市椒江区', '椒江区', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1010, now(), now(), NULL, '浙江省台州市黄岩区', '黄岩区', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1011, now(), now(), NULL, '浙江省台州市路桥区', '路桥区', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1012, now(), now(), NULL, '浙江省台州市玉环县', '玉环县', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1013, now(), now(), NULL, '浙江省台州市三门县', '三门县', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1014, now(), now(), NULL, '浙江省台州市天台县', '天台县', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1015, now(), now(), NULL, '浙江省台州市仙居县', '仙居县', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1016, now(), now(), NULL, '浙江省台州市温岭市', '温岭市', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1017, now(), now(), NULL, '浙江省台州市临海市', '临海市', ',926,1008,', 1008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1018, now(), now(), NULL, '浙江省丽水市', '丽水市', ',926,', 926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1019, now(), now(), NULL, '浙江省丽水市莲都区', '莲都区', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1020, now(), now(), NULL, '浙江省丽水市青田县', '青田县', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1021, now(), now(), NULL, '浙江省丽水市缙云县', '缙云县', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1022, now(), now(), NULL, '浙江省丽水市遂昌县', '遂昌县', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1023, now(), now(), NULL, '浙江省丽水市松阳县', '松阳县', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1024, now(), now(), NULL, '浙江省丽水市云和县', '云和县', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1025, now(), now(), NULL, '浙江省丽水市庆元县', '庆元县', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1026, now(), now(), NULL, '浙江省丽水市景宁畲族自治县', '景宁畲族自治县', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1027, now(), now(), NULL, '浙江省丽水市龙泉市', '龙泉市', ',926,1018,', 1018);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1028, now(), now(), NULL, '安徽省', '安徽省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1029, now(), now(), NULL, '安徽省合肥市', '合肥市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1030, now(), now(), NULL, '安徽省合肥市瑶海区', '瑶海区', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1031, now(), now(), NULL, '安徽省合肥市庐阳区', '庐阳区', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1032, now(), now(), NULL, '安徽省合肥市蜀山区', '蜀山区', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1033, now(), now(), NULL, '安徽省合肥市包河区', '包河区', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1034, now(), now(), NULL, '安徽省合肥市长丰县', '长丰县', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1035, now(), now(), NULL, '安徽省合肥市肥东县', '肥东县', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1036, now(), now(), NULL, '安徽省合肥市肥西县', '肥西县', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1037, now(), now(), NULL, '安徽省合肥市庐江县', '庐江县', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1038, now(), now(), NULL, '安徽省合肥市巢湖市', '巢湖市', ',1028,1029,', 1029);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1039, now(), now(), NULL, '安徽省芜湖市', '芜湖市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1040, now(), now(), NULL, '安徽省芜湖市镜湖区', '镜湖区', ',1028,1039,', 1039);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1041, now(), now(), NULL, '安徽省芜湖市弋江区', '弋江区', ',1028,1039,', 1039);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1042, now(), now(), NULL, '安徽省芜湖市鸠江区', '鸠江区', ',1028,1039,', 1039);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1043, now(), now(), NULL, '安徽省芜湖市三山区', '三山区', ',1028,1039,', 1039);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1044, now(), now(), NULL, '安徽省芜湖市芜湖县', '芜湖县', ',1028,1039,', 1039);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1045, now(), now(), NULL, '安徽省芜湖市繁昌县', '繁昌县', ',1028,1039,', 1039);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1046, now(), now(), NULL, '安徽省芜湖市南陵县', '南陵县', ',1028,1039,', 1039);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1047, now(), now(), NULL, '安徽省芜湖市无为县', '无为县', ',1028,1039,', 1039);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1048, now(), now(), NULL, '安徽省蚌埠市', '蚌埠市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1049, now(), now(), NULL, '安徽省蚌埠市龙子湖区', '龙子湖区', ',1028,1048,', 1048);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1050, now(), now(), NULL, '安徽省蚌埠市蚌山区', '蚌山区', ',1028,1048,', 1048);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1051, now(), now(), NULL, '安徽省蚌埠市禹会区', '禹会区', ',1028,1048,', 1048);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1052, now(), now(), NULL, '安徽省蚌埠市淮上区', '淮上区', ',1028,1048,', 1048);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1053, now(), now(), NULL, '安徽省蚌埠市怀远县', '怀远县', ',1028,1048,', 1048);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1054, now(), now(), NULL, '安徽省蚌埠市五河县', '五河县', ',1028,1048,', 1048);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1055, now(), now(), NULL, '安徽省蚌埠市固镇县', '固镇县', ',1028,1048,', 1048);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1056, now(), now(), NULL, '安徽省淮南市', '淮南市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1057, now(), now(), NULL, '安徽省淮南市大通区', '大通区', ',1028,1056,', 1056);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1058, now(), now(), NULL, '安徽省淮南市田家庵区', '田家庵区', ',1028,1056,', 1056);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1059, now(), now(), NULL, '安徽省淮南市谢家集区', '谢家集区', ',1028,1056,', 1056);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1060, now(), now(), NULL, '安徽省淮南市八公山区', '八公山区', ',1028,1056,', 1056);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1061, now(), now(), NULL, '安徽省淮南市潘集区', '潘集区', ',1028,1056,', 1056);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1062, now(), now(), NULL, '安徽省淮南市凤台县', '凤台县', ',1028,1056,', 1056);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1063, now(), now(), NULL, '安徽省马鞍山市', '马鞍山市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1064, now(), now(), NULL, '安徽省马鞍山市花山区', '花山区', ',1028,1063,', 1063);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1065, now(), now(), NULL, '安徽省马鞍山市雨山区', '雨山区', ',1028,1063,', 1063);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1066, now(), now(), NULL, '安徽省马鞍山市博望区', '博望区', ',1028,1063,', 1063);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1067, now(), now(), NULL, '安徽省马鞍山市当涂县', '当涂县', ',1028,1063,', 1063);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1068, now(), now(), NULL, '安徽省马鞍山市含山县', '含山县', ',1028,1063,', 1063);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1069, now(), now(), NULL, '安徽省马鞍山市和县', '和县', ',1028,1063,', 1063);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1070, now(), now(), NULL, '安徽省淮北市', '淮北市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1071, now(), now(), NULL, '安徽省淮北市杜集区', '杜集区', ',1028,1070,', 1070);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1072, now(), now(), NULL, '安徽省淮北市相山区', '相山区', ',1028,1070,', 1070);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1073, now(), now(), NULL, '安徽省淮北市烈山区', '烈山区', ',1028,1070,', 1070);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1074, now(), now(), NULL, '安徽省淮北市濉溪县', '濉溪县', ',1028,1070,', 1070);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1075, now(), now(), NULL, '安徽省铜陵市', '铜陵市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1076, now(), now(), NULL, '安徽省铜陵市铜官山区', '铜官山区', ',1028,1075,', 1075);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1077, now(), now(), NULL, '安徽省铜陵市狮子山区', '狮子山区', ',1028,1075,', 1075);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1078, now(), now(), NULL, '安徽省铜陵市郊区', '郊区', ',1028,1075,', 1075);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1079, now(), now(), NULL, '安徽省铜陵市铜陵县', '铜陵县', ',1028,1075,', 1075);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1080, now(), now(), NULL, '安徽省安庆市', '安庆市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1081, now(), now(), NULL, '安徽省安庆市迎江区', '迎江区', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1082, now(), now(), NULL, '安徽省安庆市大观区', '大观区', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1083, now(), now(), NULL, '安徽省安庆市宜秀区', '宜秀区', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1084, now(), now(), NULL, '安徽省安庆市怀宁县', '怀宁县', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1085, now(), now(), NULL, '安徽省安庆市枞阳县', '枞阳县', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1086, now(), now(), NULL, '安徽省安庆市潜山县', '潜山县', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1087, now(), now(), NULL, '安徽省安庆市太湖县', '太湖县', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1088, now(), now(), NULL, '安徽省安庆市宿松县', '宿松县', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1089, now(), now(), NULL, '安徽省安庆市望江县', '望江县', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1090, now(), now(), NULL, '安徽省安庆市岳西县', '岳西县', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1091, now(), now(), NULL, '安徽省安庆市桐城市', '桐城市', ',1028,1080,', 1080);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1092, now(), now(), NULL, '安徽省黄山市', '黄山市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1093, now(), now(), NULL, '安徽省黄山市屯溪区', '屯溪区', ',1028,1092,', 1092);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1094, now(), now(), NULL, '安徽省黄山市黄山区', '黄山区', ',1028,1092,', 1092);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1095, now(), now(), NULL, '安徽省黄山市徽州区', '徽州区', ',1028,1092,', 1092);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1096, now(), now(), NULL, '安徽省黄山市歙县', '歙县', ',1028,1092,', 1092);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1097, now(), now(), NULL, '安徽省黄山市休宁县', '休宁县', ',1028,1092,', 1092);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1098, now(), now(), NULL, '安徽省黄山市黟县', '黟县', ',1028,1092,', 1092);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1099, now(), now(), NULL, '安徽省黄山市祁门县', '祁门县', ',1028,1092,', 1092);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1100, now(), now(), NULL, '安徽省滁州市', '滁州市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1101, now(), now(), NULL, '安徽省滁州市琅琊区', '琅琊区', ',1028,1100,', 1100);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1102, now(), now(), NULL, '安徽省滁州市南谯区', '南谯区', ',1028,1100,', 1100);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1103, now(), now(), NULL, '安徽省滁州市来安县', '来安县', ',1028,1100,', 1100);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1104, now(), now(), NULL, '安徽省滁州市全椒县', '全椒县', ',1028,1100,', 1100);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1105, now(), now(), NULL, '安徽省滁州市定远县', '定远县', ',1028,1100,', 1100);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1106, now(), now(), NULL, '安徽省滁州市凤阳县', '凤阳县', ',1028,1100,', 1100);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1107, now(), now(), NULL, '安徽省滁州市天长市', '天长市', ',1028,1100,', 1100);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1108, now(), now(), NULL, '安徽省滁州市明光市', '明光市', ',1028,1100,', 1100);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1109, now(), now(), NULL, '安徽省阜阳市', '阜阳市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1110, now(), now(), NULL, '安徽省阜阳市颍州区', '颍州区', ',1028,1109,', 1109);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1111, now(), now(), NULL, '安徽省阜阳市颍东区', '颍东区', ',1028,1109,', 1109);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1112, now(), now(), NULL, '安徽省阜阳市颍泉区', '颍泉区', ',1028,1109,', 1109);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1113, now(), now(), NULL, '安徽省阜阳市临泉县', '临泉县', ',1028,1109,', 1109);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1114, now(), now(), NULL, '安徽省阜阳市太和县', '太和县', ',1028,1109,', 1109);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1115, now(), now(), NULL, '安徽省阜阳市阜南县', '阜南县', ',1028,1109,', 1109);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1116, now(), now(), NULL, '安徽省阜阳市颍上县', '颍上县', ',1028,1109,', 1109);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1117, now(), now(), NULL, '安徽省阜阳市界首市', '界首市', ',1028,1109,', 1109);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1118, now(), now(), NULL, '安徽省宿州市', '宿州市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1119, now(), now(), NULL, '安徽省宿州市埇桥区', '埇桥区', ',1028,1118,', 1118);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1120, now(), now(), NULL, '安徽省宿州市砀山县', '砀山县', ',1028,1118,', 1118);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1121, now(), now(), NULL, '安徽省宿州市萧县', '萧县', ',1028,1118,', 1118);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1122, now(), now(), NULL, '安徽省宿州市灵璧县', '灵璧县', ',1028,1118,', 1118);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1123, now(), now(), NULL, '安徽省宿州市泗县', '泗县', ',1028,1118,', 1118);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1124, now(), now(), NULL, '安徽省六安市', '六安市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1125, now(), now(), NULL, '安徽省六安市金安区', '金安区', ',1028,1124,', 1124);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1126, now(), now(), NULL, '安徽省六安市裕安区', '裕安区', ',1028,1124,', 1124);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1127, now(), now(), NULL, '安徽省六安市寿县', '寿县', ',1028,1124,', 1124);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1128, now(), now(), NULL, '安徽省六安市霍邱县', '霍邱县', ',1028,1124,', 1124);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1129, now(), now(), NULL, '安徽省六安市舒城县', '舒城县', ',1028,1124,', 1124);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1130, now(), now(), NULL, '安徽省六安市金寨县', '金寨县', ',1028,1124,', 1124);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1131, now(), now(), NULL, '安徽省六安市霍山县', '霍山县', ',1028,1124,', 1124);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1132, now(), now(), NULL, '安徽省亳州市', '亳州市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1133, now(), now(), NULL, '安徽省亳州市谯城区', '谯城区', ',1028,1132,', 1132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1134, now(), now(), NULL, '安徽省亳州市涡阳县', '涡阳县', ',1028,1132,', 1132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1135, now(), now(), NULL, '安徽省亳州市蒙城县', '蒙城县', ',1028,1132,', 1132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1136, now(), now(), NULL, '安徽省亳州市利辛县', '利辛县', ',1028,1132,', 1132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1137, now(), now(), NULL, '安徽省池州市', '池州市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1138, now(), now(), NULL, '安徽省池州市贵池区', '贵池区', ',1028,1137,', 1137);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1139, now(), now(), NULL, '安徽省池州市东至县', '东至县', ',1028,1137,', 1137);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1140, now(), now(), NULL, '安徽省池州市石台县', '石台县', ',1028,1137,', 1137);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1141, now(), now(), NULL, '安徽省池州市青阳县', '青阳县', ',1028,1137,', 1137);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1142, now(), now(), NULL, '安徽省宣城市', '宣城市', ',1028,', 1028);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1143, now(), now(), NULL, '安徽省宣城市宣州区', '宣州区', ',1028,1142,', 1142);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1144, now(), now(), NULL, '安徽省宣城市郎溪县', '郎溪县', ',1028,1142,', 1142);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1145, now(), now(), NULL, '安徽省宣城市广德县', '广德县', ',1028,1142,', 1142);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1146, now(), now(), NULL, '安徽省宣城市泾县', '泾县', ',1028,1142,', 1142);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1147, now(), now(), NULL, '安徽省宣城市绩溪县', '绩溪县', ',1028,1142,', 1142);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1148, now(), now(), NULL, '安徽省宣城市旌德县', '旌德县', ',1028,1142,', 1142);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1149, now(), now(), NULL, '安徽省宣城市宁国市', '宁国市', ',1028,1142,', 1142);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1150, now(), now(), NULL, '福建省', '福建省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1151, now(), now(), NULL, '福建省福州市', '福州市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1152, now(), now(), NULL, '福建省福州市鼓楼区', '鼓楼区', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1153, now(), now(), NULL, '福建省福州市台江区', '台江区', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1154, now(), now(), NULL, '福建省福州市仓山区', '仓山区', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1155, now(), now(), NULL, '福建省福州市马尾区', '马尾区', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1156, now(), now(), NULL, '福建省福州市晋安区', '晋安区', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1157, now(), now(), NULL, '福建省福州市闽侯县', '闽侯县', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1158, now(), now(), NULL, '福建省福州市连江县', '连江县', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1159, now(), now(), NULL, '福建省福州市罗源县', '罗源县', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1160, now(), now(), NULL, '福建省福州市闽清县', '闽清县', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1161, now(), now(), NULL, '福建省福州市永泰县', '永泰县', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1162, now(), now(), NULL, '福建省福州市平潭县', '平潭县', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1163, now(), now(), NULL, '福建省福州市福清市', '福清市', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1164, now(), now(), NULL, '福建省福州市长乐市', '长乐市', ',1150,1151,', 1151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1165, now(), now(), NULL, '福建省厦门市', '厦门市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1166, now(), now(), NULL, '福建省厦门市思明区', '思明区', ',1150,1165,', 1165);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1167, now(), now(), NULL, '福建省厦门市海沧区', '海沧区', ',1150,1165,', 1165);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1168, now(), now(), NULL, '福建省厦门市湖里区', '湖里区', ',1150,1165,', 1165);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1169, now(), now(), NULL, '福建省厦门市集美区', '集美区', ',1150,1165,', 1165);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1170, now(), now(), NULL, '福建省厦门市同安区', '同安区', ',1150,1165,', 1165);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1171, now(), now(), NULL, '福建省厦门市翔安区', '翔安区', ',1150,1165,', 1165);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1172, now(), now(), NULL, '福建省莆田市', '莆田市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1173, now(), now(), NULL, '福建省莆田市城厢区', '城厢区', ',1150,1172,', 1172);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1174, now(), now(), NULL, '福建省莆田市涵江区', '涵江区', ',1150,1172,', 1172);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1175, now(), now(), NULL, '福建省莆田市荔城区', '荔城区', ',1150,1172,', 1172);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1176, now(), now(), NULL, '福建省莆田市秀屿区', '秀屿区', ',1150,1172,', 1172);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1177, now(), now(), NULL, '福建省莆田市仙游县', '仙游县', ',1150,1172,', 1172);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1178, now(), now(), NULL, '福建省三明市', '三明市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1179, now(), now(), NULL, '福建省三明市梅列区', '梅列区', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1180, now(), now(), NULL, '福建省三明市三元区', '三元区', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1181, now(), now(), NULL, '福建省三明市明溪县', '明溪县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1182, now(), now(), NULL, '福建省三明市清流县', '清流县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1183, now(), now(), NULL, '福建省三明市宁化县', '宁化县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1184, now(), now(), NULL, '福建省三明市大田县', '大田县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1185, now(), now(), NULL, '福建省三明市尤溪县', '尤溪县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1186, now(), now(), NULL, '福建省三明市沙县', '沙县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1187, now(), now(), NULL, '福建省三明市将乐县', '将乐县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1188, now(), now(), NULL, '福建省三明市泰宁县', '泰宁县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1189, now(), now(), NULL, '福建省三明市建宁县', '建宁县', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1190, now(), now(), NULL, '福建省三明市永安市', '永安市', ',1150,1178,', 1178);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1191, now(), now(), NULL, '福建省泉州市', '泉州市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1192, now(), now(), NULL, '福建省泉州市鲤城区', '鲤城区', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1193, now(), now(), NULL, '福建省泉州市丰泽区', '丰泽区', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1194, now(), now(), NULL, '福建省泉州市洛江区', '洛江区', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1195, now(), now(), NULL, '福建省泉州市泉港区', '泉港区', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1196, now(), now(), NULL, '福建省泉州市惠安县', '惠安县', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1197, now(), now(), NULL, '福建省泉州市安溪县', '安溪县', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1198, now(), now(), NULL, '福建省泉州市永春县', '永春县', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1199, now(), now(), NULL, '福建省泉州市德化县', '德化县', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1200, now(), now(), NULL, '福建省泉州市金门县', '金门县', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1201, now(), now(), NULL, '福建省泉州市石狮市', '石狮市', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1202, now(), now(), NULL, '福建省泉州市晋江市', '晋江市', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1203, now(), now(), NULL, '福建省泉州市南安市', '南安市', ',1150,1191,', 1191);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1204, now(), now(), NULL, '福建省漳州市', '漳州市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1205, now(), now(), NULL, '福建省漳州市芗城区', '芗城区', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1206, now(), now(), NULL, '福建省漳州市龙文区', '龙文区', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1207, now(), now(), NULL, '福建省漳州市云霄县', '云霄县', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1208, now(), now(), NULL, '福建省漳州市漳浦县', '漳浦县', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1209, now(), now(), NULL, '福建省漳州市诏安县', '诏安县', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1210, now(), now(), NULL, '福建省漳州市长泰县', '长泰县', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1211, now(), now(), NULL, '福建省漳州市东山县', '东山县', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1212, now(), now(), NULL, '福建省漳州市南靖县', '南靖县', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1213, now(), now(), NULL, '福建省漳州市平和县', '平和县', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1214, now(), now(), NULL, '福建省漳州市华安县', '华安县', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1215, now(), now(), NULL, '福建省漳州市龙海市', '龙海市', ',1150,1204,', 1204);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1216, now(), now(), NULL, '福建省南平市', '南平市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1217, now(), now(), NULL, '福建省南平市延平区', '延平区', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1218, now(), now(), NULL, '福建省南平市顺昌县', '顺昌县', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1219, now(), now(), NULL, '福建省南平市浦城县', '浦城县', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1220, now(), now(), NULL, '福建省南平市光泽县', '光泽县', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1221, now(), now(), NULL, '福建省南平市松溪县', '松溪县', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1222, now(), now(), NULL, '福建省南平市政和县', '政和县', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1223, now(), now(), NULL, '福建省南平市邵武市', '邵武市', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1224, now(), now(), NULL, '福建省南平市武夷山市', '武夷山市', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1225, now(), now(), NULL, '福建省南平市建瓯市', '建瓯市', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1226, now(), now(), NULL, '福建省南平市建阳市', '建阳市', ',1150,1216,', 1216);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1227, now(), now(), NULL, '福建省龙岩市', '龙岩市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1228, now(), now(), NULL, '福建省龙岩市新罗区', '新罗区', ',1150,1227,', 1227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1229, now(), now(), NULL, '福建省龙岩市长汀县', '长汀县', ',1150,1227,', 1227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1230, now(), now(), NULL, '福建省龙岩市永定县', '永定县', ',1150,1227,', 1227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1231, now(), now(), NULL, '福建省龙岩市上杭县', '上杭县', ',1150,1227,', 1227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1232, now(), now(), NULL, '福建省龙岩市武平县', '武平县', ',1150,1227,', 1227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1233, now(), now(), NULL, '福建省龙岩市连城县', '连城县', ',1150,1227,', 1227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1234, now(), now(), NULL, '福建省龙岩市漳平市', '漳平市', ',1150,1227,', 1227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1235, now(), now(), NULL, '福建省宁德市', '宁德市', ',1150,', 1150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1236, now(), now(), NULL, '福建省宁德市蕉城区', '蕉城区', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1237, now(), now(), NULL, '福建省宁德市霞浦县', '霞浦县', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1238, now(), now(), NULL, '福建省宁德市古田县', '古田县', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1239, now(), now(), NULL, '福建省宁德市屏南县', '屏南县', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1240, now(), now(), NULL, '福建省宁德市寿宁县', '寿宁县', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1241, now(), now(), NULL, '福建省宁德市周宁县', '周宁县', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1242, now(), now(), NULL, '福建省宁德市柘荣县', '柘荣县', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1243, now(), now(), NULL, '福建省宁德市福安市', '福安市', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1244, now(), now(), NULL, '福建省宁德市福鼎市', '福鼎市', ',1150,1235,', 1235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1245, now(), now(), NULL, '江西省', '江西省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1246, now(), now(), NULL, '江西省南昌市', '南昌市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1247, now(), now(), NULL, '江西省南昌市东湖区', '东湖区', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1248, now(), now(), NULL, '江西省南昌市西湖区', '西湖区', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1249, now(), now(), NULL, '江西省南昌市青云谱区', '青云谱区', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1250, now(), now(), NULL, '江西省南昌市湾里区', '湾里区', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1251, now(), now(), NULL, '江西省南昌市青山湖区', '青山湖区', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1252, now(), now(), NULL, '江西省南昌市南昌县', '南昌县', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1253, now(), now(), NULL, '江西省南昌市新建县', '新建县', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1254, now(), now(), NULL, '江西省南昌市安义县', '安义县', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1255, now(), now(), NULL, '江西省南昌市进贤县', '进贤县', ',1245,1246,', 1246);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1256, now(), now(), NULL, '江西省景德镇市', '景德镇市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1257, now(), now(), NULL, '江西省景德镇市昌江区', '昌江区', ',1245,1256,', 1256);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1258, now(), now(), NULL, '江西省景德镇市珠山区', '珠山区', ',1245,1256,', 1256);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1259, now(), now(), NULL, '江西省景德镇市浮梁县', '浮梁县', ',1245,1256,', 1256);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1260, now(), now(), NULL, '江西省景德镇市乐平市', '乐平市', ',1245,1256,', 1256);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1261, now(), now(), NULL, '江西省萍乡市', '萍乡市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1262, now(), now(), NULL, '江西省萍乡市安源区', '安源区', ',1245,1261,', 1261);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1263, now(), now(), NULL, '江西省萍乡市湘东区', '湘东区', ',1245,1261,', 1261);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1264, now(), now(), NULL, '江西省萍乡市莲花县', '莲花县', ',1245,1261,', 1261);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1265, now(), now(), NULL, '江西省萍乡市上栗县', '上栗县', ',1245,1261,', 1261);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1266, now(), now(), NULL, '江西省萍乡市芦溪县', '芦溪县', ',1245,1261,', 1261);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1267, now(), now(), NULL, '江西省九江市', '九江市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1268, now(), now(), NULL, '江西省九江市庐山区', '庐山区', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1269, now(), now(), NULL, '江西省九江市浔阳区', '浔阳区', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1270, now(), now(), NULL, '江西省九江市九江县', '九江县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1271, now(), now(), NULL, '江西省九江市武宁县', '武宁县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1272, now(), now(), NULL, '江西省九江市修水县', '修水县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1273, now(), now(), NULL, '江西省九江市永修县', '永修县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1274, now(), now(), NULL, '江西省九江市德安县', '德安县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1275, now(), now(), NULL, '江西省九江市星子县', '星子县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1276, now(), now(), NULL, '江西省九江市都昌县', '都昌县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1277, now(), now(), NULL, '江西省九江市湖口县', '湖口县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1278, now(), now(), NULL, '江西省九江市彭泽县', '彭泽县', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1279, now(), now(), NULL, '江西省九江市瑞昌市', '瑞昌市', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1280, now(), now(), NULL, '江西省九江市共青城市', '共青城市', ',1245,1267,', 1267);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1281, now(), now(), NULL, '江西省新余市', '新余市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1282, now(), now(), NULL, '江西省新余市渝水区', '渝水区', ',1245,1281,', 1281);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1283, now(), now(), NULL, '江西省新余市分宜县', '分宜县', ',1245,1281,', 1281);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1284, now(), now(), NULL, '江西省鹰潭市', '鹰潭市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1285, now(), now(), NULL, '江西省鹰潭市月湖区', '月湖区', ',1245,1284,', 1284);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1286, now(), now(), NULL, '江西省鹰潭市余江县', '余江县', ',1245,1284,', 1284);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1287, now(), now(), NULL, '江西省鹰潭市贵溪市', '贵溪市', ',1245,1284,', 1284);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1288, now(), now(), NULL, '江西省赣州市', '赣州市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1289, now(), now(), NULL, '江西省赣州市章贡区', '章贡区', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1290, now(), now(), NULL, '江西省赣州市赣县', '赣县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1291, now(), now(), NULL, '江西省赣州市信丰县', '信丰县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1292, now(), now(), NULL, '江西省赣州市大余县', '大余县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1293, now(), now(), NULL, '江西省赣州市上犹县', '上犹县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1294, now(), now(), NULL, '江西省赣州市崇义县', '崇义县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1295, now(), now(), NULL, '江西省赣州市安远县', '安远县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1296, now(), now(), NULL, '江西省赣州市龙南县', '龙南县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1297, now(), now(), NULL, '江西省赣州市定南县', '定南县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1298, now(), now(), NULL, '江西省赣州市全南县', '全南县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1299, now(), now(), NULL, '江西省赣州市宁都县', '宁都县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1300, now(), now(), NULL, '江西省赣州市于都县', '于都县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1301, now(), now(), NULL, '江西省赣州市兴国县', '兴国县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1302, now(), now(), NULL, '江西省赣州市会昌县', '会昌县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1303, now(), now(), NULL, '江西省赣州市寻乌县', '寻乌县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1304, now(), now(), NULL, '江西省赣州市石城县', '石城县', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1305, now(), now(), NULL, '江西省赣州市瑞金市', '瑞金市', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1306, now(), now(), NULL, '江西省赣州市南康市', '南康市', ',1245,1288,', 1288);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1307, now(), now(), NULL, '江西省吉安市', '吉安市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1308, now(), now(), NULL, '江西省吉安市吉州区', '吉州区', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1309, now(), now(), NULL, '江西省吉安市青原区', '青原区', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1310, now(), now(), NULL, '江西省吉安市吉安县', '吉安县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1311, now(), now(), NULL, '江西省吉安市吉水县', '吉水县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1312, now(), now(), NULL, '江西省吉安市峡江县', '峡江县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1313, now(), now(), NULL, '江西省吉安市新干县', '新干县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1314, now(), now(), NULL, '江西省吉安市永丰县', '永丰县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1315, now(), now(), NULL, '江西省吉安市泰和县', '泰和县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1316, now(), now(), NULL, '江西省吉安市遂川县', '遂川县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1317, now(), now(), NULL, '江西省吉安市万安县', '万安县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1318, now(), now(), NULL, '江西省吉安市安福县', '安福县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1319, now(), now(), NULL, '江西省吉安市永新县', '永新县', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1320, now(), now(), NULL, '江西省吉安市井冈山市', '井冈山市', ',1245,1307,', 1307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1321, now(), now(), NULL, '江西省宜春市', '宜春市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1322, now(), now(), NULL, '江西省宜春市袁州区', '袁州区', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1323, now(), now(), NULL, '江西省宜春市奉新县', '奉新县', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1324, now(), now(), NULL, '江西省宜春市万载县', '万载县', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1325, now(), now(), NULL, '江西省宜春市上高县', '上高县', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1326, now(), now(), NULL, '江西省宜春市宜丰县', '宜丰县', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1327, now(), now(), NULL, '江西省宜春市靖安县', '靖安县', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1328, now(), now(), NULL, '江西省宜春市铜鼓县', '铜鼓县', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1329, now(), now(), NULL, '江西省宜春市丰城市', '丰城市', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1330, now(), now(), NULL, '江西省宜春市樟树市', '樟树市', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1331, now(), now(), NULL, '江西省宜春市高安市', '高安市', ',1245,1321,', 1321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1332, now(), now(), NULL, '江西省抚州市', '抚州市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1333, now(), now(), NULL, '江西省抚州市临川区', '临川区', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1334, now(), now(), NULL, '江西省抚州市南城县', '南城县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1335, now(), now(), NULL, '江西省抚州市黎川县', '黎川县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1336, now(), now(), NULL, '江西省抚州市南丰县', '南丰县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1337, now(), now(), NULL, '江西省抚州市崇仁县', '崇仁县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1338, now(), now(), NULL, '江西省抚州市乐安县', '乐安县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1339, now(), now(), NULL, '江西省抚州市宜黄县', '宜黄县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1340, now(), now(), NULL, '江西省抚州市金溪县', '金溪县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1341, now(), now(), NULL, '江西省抚州市资溪县', '资溪县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1342, now(), now(), NULL, '江西省抚州市东乡县', '东乡县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1343, now(), now(), NULL, '江西省抚州市广昌县', '广昌县', ',1245,1332,', 1332);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1344, now(), now(), NULL, '江西省上饶市', '上饶市', ',1245,', 1245);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1345, now(), now(), NULL, '江西省上饶市信州区', '信州区', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1346, now(), now(), NULL, '江西省上饶市上饶县', '上饶县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1347, now(), now(), NULL, '江西省上饶市广丰县', '广丰县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1348, now(), now(), NULL, '江西省上饶市玉山县', '玉山县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1349, now(), now(), NULL, '江西省上饶市铅山县', '铅山县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1350, now(), now(), NULL, '江西省上饶市横峰县', '横峰县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1351, now(), now(), NULL, '江西省上饶市弋阳县', '弋阳县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1352, now(), now(), NULL, '江西省上饶市余干县', '余干县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1353, now(), now(), NULL, '江西省上饶市鄱阳县', '鄱阳县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1354, now(), now(), NULL, '江西省上饶市万年县', '万年县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1355, now(), now(), NULL, '江西省上饶市婺源县', '婺源县', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1356, now(), now(), NULL, '江西省上饶市德兴市', '德兴市', ',1245,1344,', 1344);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1357, now(), now(), NULL, '山东省', '山东省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1358, now(), now(), NULL, '山东省济南市', '济南市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1359, now(), now(), NULL, '山东省济南市历下区', '历下区', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1360, now(), now(), NULL, '山东省济南市市中区', '市中区', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1361, now(), now(), NULL, '山东省济南市槐荫区', '槐荫区', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1362, now(), now(), NULL, '山东省济南市天桥区', '天桥区', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1363, now(), now(), NULL, '山东省济南市历城区', '历城区', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1364, now(), now(), NULL, '山东省济南市长清区', '长清区', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1365, now(), now(), NULL, '山东省济南市平阴县', '平阴县', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1366, now(), now(), NULL, '山东省济南市济阳县', '济阳县', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1367, now(), now(), NULL, '山东省济南市商河县', '商河县', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1368, now(), now(), NULL, '山东省济南市章丘市', '章丘市', ',1357,1358,', 1358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1369, now(), now(), NULL, '山东省青岛市', '青岛市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1370, now(), now(), NULL, '山东省青岛市市南区', '市南区', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1371, now(), now(), NULL, '山东省青岛市市北区', '市北区', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1372, now(), now(), NULL, '山东省青岛市四方区', '四方区', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1373, now(), now(), NULL, '山东省青岛市黄岛区', '黄岛区', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1374, now(), now(), NULL, '山东省青岛市崂山区', '崂山区', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1375, now(), now(), NULL, '山东省青岛市李沧区', '李沧区', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1376, now(), now(), NULL, '山东省青岛市城阳区', '城阳区', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1377, now(), now(), NULL, '山东省青岛市胶州市', '胶州市', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1378, now(), now(), NULL, '山东省青岛市即墨市', '即墨市', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1379, now(), now(), NULL, '山东省青岛市平度市', '平度市', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1380, now(), now(), NULL, '山东省青岛市胶南市', '胶南市', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1381, now(), now(), NULL, '山东省青岛市莱西市', '莱西市', ',1357,1369,', 1369);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1382, now(), now(), NULL, '山东省淄博市', '淄博市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1383, now(), now(), NULL, '山东省淄博市淄川区', '淄川区', ',1357,1382,', 1382);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1384, now(), now(), NULL, '山东省淄博市张店区', '张店区', ',1357,1382,', 1382);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1385, now(), now(), NULL, '山东省淄博市博山区', '博山区', ',1357,1382,', 1382);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1386, now(), now(), NULL, '山东省淄博市临淄区', '临淄区', ',1357,1382,', 1382);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1387, now(), now(), NULL, '山东省淄博市周村区', '周村区', ',1357,1382,', 1382);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1388, now(), now(), NULL, '山东省淄博市桓台县', '桓台县', ',1357,1382,', 1382);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1389, now(), now(), NULL, '山东省淄博市高青县', '高青县', ',1357,1382,', 1382);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1390, now(), now(), NULL, '山东省淄博市沂源县', '沂源县', ',1357,1382,', 1382);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1391, now(), now(), NULL, '山东省枣庄市', '枣庄市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1392, now(), now(), NULL, '山东省枣庄市市中区', '市中区', ',1357,1391,', 1391);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1393, now(), now(), NULL, '山东省枣庄市薛城区', '薛城区', ',1357,1391,', 1391);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1394, now(), now(), NULL, '山东省枣庄市峄城区', '峄城区', ',1357,1391,', 1391);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1395, now(), now(), NULL, '山东省枣庄市台儿庄区', '台儿庄区', ',1357,1391,', 1391);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1396, now(), now(), NULL, '山东省枣庄市山亭区', '山亭区', ',1357,1391,', 1391);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1397, now(), now(), NULL, '山东省枣庄市滕州市', '滕州市', ',1357,1391,', 1391);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1398, now(), now(), NULL, '山东省东营市', '东营市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1399, now(), now(), NULL, '山东省东营市东营区', '东营区', ',1357,1398,', 1398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1400, now(), now(), NULL, '山东省东营市河口区', '河口区', ',1357,1398,', 1398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1401, now(), now(), NULL, '山东省东营市垦利县', '垦利县', ',1357,1398,', 1398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1402, now(), now(), NULL, '山东省东营市利津县', '利津县', ',1357,1398,', 1398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1403, now(), now(), NULL, '山东省东营市广饶县', '广饶县', ',1357,1398,', 1398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1404, now(), now(), NULL, '山东省烟台市', '烟台市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1405, now(), now(), NULL, '山东省烟台市芝罘区', '芝罘区', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1406, now(), now(), NULL, '山东省烟台市福山区', '福山区', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1407, now(), now(), NULL, '山东省烟台市牟平区', '牟平区', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1408, now(), now(), NULL, '山东省烟台市莱山区', '莱山区', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1409, now(), now(), NULL, '山东省烟台市长岛县', '长岛县', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1410, now(), now(), NULL, '山东省烟台市龙口市', '龙口市', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1411, now(), now(), NULL, '山东省烟台市莱阳市', '莱阳市', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1412, now(), now(), NULL, '山东省烟台市莱州市', '莱州市', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1413, now(), now(), NULL, '山东省烟台市蓬莱市', '蓬莱市', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1414, now(), now(), NULL, '山东省烟台市招远市', '招远市', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1415, now(), now(), NULL, '山东省烟台市栖霞市', '栖霞市', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1416, now(), now(), NULL, '山东省烟台市海阳市', '海阳市', ',1357,1404,', 1404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1417, now(), now(), NULL, '山东省潍坊市', '潍坊市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1418, now(), now(), NULL, '山东省潍坊市潍城区', '潍城区', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1419, now(), now(), NULL, '山东省潍坊市寒亭区', '寒亭区', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1420, now(), now(), NULL, '山东省潍坊市坊子区', '坊子区', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1421, now(), now(), NULL, '山东省潍坊市奎文区', '奎文区', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1422, now(), now(), NULL, '山东省潍坊市临朐县', '临朐县', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1423, now(), now(), NULL, '山东省潍坊市昌乐县', '昌乐县', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1424, now(), now(), NULL, '山东省潍坊市青州市', '青州市', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1425, now(), now(), NULL, '山东省潍坊市诸城市', '诸城市', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1426, now(), now(), NULL, '山东省潍坊市寿光市', '寿光市', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1427, now(), now(), NULL, '山东省潍坊市安丘市', '安丘市', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1428, now(), now(), NULL, '山东省潍坊市高密市', '高密市', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1429, now(), now(), NULL, '山东省潍坊市昌邑市', '昌邑市', ',1357,1417,', 1417);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1430, now(), now(), NULL, '山东省济宁市', '济宁市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1431, now(), now(), NULL, '山东省济宁市市中区', '市中区', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1432, now(), now(), NULL, '山东省济宁市任城区', '任城区', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1433, now(), now(), NULL, '山东省济宁市微山县', '微山县', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1434, now(), now(), NULL, '山东省济宁市鱼台县', '鱼台县', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1435, now(), now(), NULL, '山东省济宁市金乡县', '金乡县', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1436, now(), now(), NULL, '山东省济宁市嘉祥县', '嘉祥县', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1437, now(), now(), NULL, '山东省济宁市汶上县', '汶上县', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1438, now(), now(), NULL, '山东省济宁市泗水县', '泗水县', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1439, now(), now(), NULL, '山东省济宁市梁山县', '梁山县', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1440, now(), now(), NULL, '山东省济宁市曲阜市', '曲阜市', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1441, now(), now(), NULL, '山东省济宁市兖州市', '兖州市', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1442, now(), now(), NULL, '山东省济宁市邹城市', '邹城市', ',1357,1430,', 1430);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1443, now(), now(), NULL, '山东省泰安市', '泰安市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1444, now(), now(), NULL, '山东省泰安市泰山区', '泰山区', ',1357,1443,', 1443);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1445, now(), now(), NULL, '山东省泰安市岱岳区', '岱岳区', ',1357,1443,', 1443);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1446, now(), now(), NULL, '山东省泰安市宁阳县', '宁阳县', ',1357,1443,', 1443);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1447, now(), now(), NULL, '山东省泰安市东平县', '东平县', ',1357,1443,', 1443);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1448, now(), now(), NULL, '山东省泰安市新泰市', '新泰市', ',1357,1443,', 1443);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1449, now(), now(), NULL, '山东省泰安市肥城市', '肥城市', ',1357,1443,', 1443);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1450, now(), now(), NULL, '山东省威海市', '威海市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1451, now(), now(), NULL, '山东省威海市环翠区', '环翠区', ',1357,1450,', 1450);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1452, now(), now(), NULL, '山东省威海市文登市', '文登市', ',1357,1450,', 1450);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1453, now(), now(), NULL, '山东省威海市荣成市', '荣成市', ',1357,1450,', 1450);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1454, now(), now(), NULL, '山东省威海市乳山市', '乳山市', ',1357,1450,', 1450);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1455, now(), now(), NULL, '山东省日照市', '日照市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1456, now(), now(), NULL, '山东省日照市东港区', '东港区', ',1357,1455,', 1455);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1457, now(), now(), NULL, '山东省日照市岚山区', '岚山区', ',1357,1455,', 1455);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1458, now(), now(), NULL, '山东省日照市五莲县', '五莲县', ',1357,1455,', 1455);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1459, now(), now(), NULL, '山东省日照市莒县', '莒县', ',1357,1455,', 1455);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1460, now(), now(), NULL, '山东省莱芜市', '莱芜市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1461, now(), now(), NULL, '山东省莱芜市莱城区', '莱城区', ',1357,1460,', 1460);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1462, now(), now(), NULL, '山东省莱芜市钢城区', '钢城区', ',1357,1460,', 1460);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1463, now(), now(), NULL, '山东省临沂市', '临沂市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1464, now(), now(), NULL, '山东省临沂市兰山区', '兰山区', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1465, now(), now(), NULL, '山东省临沂市罗庄区', '罗庄区', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1466, now(), now(), NULL, '山东省临沂市河东区', '河东区', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1467, now(), now(), NULL, '山东省临沂市沂南县', '沂南县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1468, now(), now(), NULL, '山东省临沂市郯城县', '郯城县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1469, now(), now(), NULL, '山东省临沂市沂水县', '沂水县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1470, now(), now(), NULL, '山东省临沂市苍山县', '苍山县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1471, now(), now(), NULL, '山东省临沂市费县', '费县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1472, now(), now(), NULL, '山东省临沂市平邑县', '平邑县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1473, now(), now(), NULL, '山东省临沂市莒南县', '莒南县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1474, now(), now(), NULL, '山东省临沂市蒙阴县', '蒙阴县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1475, now(), now(), NULL, '山东省临沂市临沭县', '临沭县', ',1357,1463,', 1463);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1476, now(), now(), NULL, '山东省德州市', '德州市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1477, now(), now(), NULL, '山东省德州市德城区', '德城区', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1478, now(), now(), NULL, '山东省德州市陵县', '陵县', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1479, now(), now(), NULL, '山东省德州市宁津县', '宁津县', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1480, now(), now(), NULL, '山东省德州市庆云县', '庆云县', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1481, now(), now(), NULL, '山东省德州市临邑县', '临邑县', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1482, now(), now(), NULL, '山东省德州市齐河县', '齐河县', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1483, now(), now(), NULL, '山东省德州市平原县', '平原县', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1484, now(), now(), NULL, '山东省德州市夏津县', '夏津县', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1485, now(), now(), NULL, '山东省德州市武城县', '武城县', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1486, now(), now(), NULL, '山东省德州市乐陵市', '乐陵市', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1487, now(), now(), NULL, '山东省德州市禹城市', '禹城市', ',1357,1476,', 1476);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1488, now(), now(), NULL, '山东省聊城市', '聊城市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1489, now(), now(), NULL, '山东省聊城市东昌府区', '东昌府区', ',1357,1488,', 1488);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1490, now(), now(), NULL, '山东省聊城市阳谷县', '阳谷县', ',1357,1488,', 1488);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1491, now(), now(), NULL, '山东省聊城市莘县', '莘县', ',1357,1488,', 1488);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1492, now(), now(), NULL, '山东省聊城市茌平县', '茌平县', ',1357,1488,', 1488);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1493, now(), now(), NULL, '山东省聊城市东阿县', '东阿县', ',1357,1488,', 1488);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1494, now(), now(), NULL, '山东省聊城市冠县', '冠县', ',1357,1488,', 1488);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1495, now(), now(), NULL, '山东省聊城市高唐县', '高唐县', ',1357,1488,', 1488);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1496, now(), now(), NULL, '山东省聊城市临清市', '临清市', ',1357,1488,', 1488);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1497, now(), now(), NULL, '山东省滨州市', '滨州市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1498, now(), now(), NULL, '山东省滨州市滨城区', '滨城区', ',1357,1497,', 1497);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1499, now(), now(), NULL, '山东省滨州市惠民县', '惠民县', ',1357,1497,', 1497);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1500, now(), now(), NULL, '山东省滨州市阳信县', '阳信县', ',1357,1497,', 1497);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1501, now(), now(), NULL, '山东省滨州市无棣县', '无棣县', ',1357,1497,', 1497);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1502, now(), now(), NULL, '山东省滨州市沾化县', '沾化县', ',1357,1497,', 1497);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1503, now(), now(), NULL, '山东省滨州市博兴县', '博兴县', ',1357,1497,', 1497);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1504, now(), now(), NULL, '山东省滨州市邹平县', '邹平县', ',1357,1497,', 1497);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1505, now(), now(), NULL, '山东省菏泽市', '菏泽市', ',1357,', 1357);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1506, now(), now(), NULL, '山东省菏泽市牡丹区', '牡丹区', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1507, now(), now(), NULL, '山东省菏泽市曹县', '曹县', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1508, now(), now(), NULL, '山东省菏泽市单县', '单县', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1509, now(), now(), NULL, '山东省菏泽市成武县', '成武县', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1510, now(), now(), NULL, '山东省菏泽市巨野县', '巨野县', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1511, now(), now(), NULL, '山东省菏泽市郓城县', '郓城县', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1512, now(), now(), NULL, '山东省菏泽市鄄城县', '鄄城县', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1513, now(), now(), NULL, '山东省菏泽市定陶县', '定陶县', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1514, now(), now(), NULL, '山东省菏泽市东明县', '东明县', ',1357,1505,', 1505);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1515, now(), now(), NULL, '河南省', '河南省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1516, now(), now(), NULL, '河南省郑州市', '郑州市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1517, now(), now(), NULL, '河南省郑州市中原区', '中原区', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1518, now(), now(), NULL, '河南省郑州市二七区', '二七区', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1519, now(), now(), NULL, '河南省郑州市管城回族区', '管城回族区', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1520, now(), now(), NULL, '河南省郑州市金水区', '金水区', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1521, now(), now(), NULL, '河南省郑州市上街区', '上街区', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1522, now(), now(), NULL, '河南省郑州市惠济区', '惠济区', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1523, now(), now(), NULL, '河南省郑州市中牟县', '中牟县', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1524, now(), now(), NULL, '河南省郑州市巩义市', '巩义市', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1525, now(), now(), NULL, '河南省郑州市荥阳市', '荥阳市', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1526, now(), now(), NULL, '河南省郑州市新密市', '新密市', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1527, now(), now(), NULL, '河南省郑州市新郑市', '新郑市', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1528, now(), now(), NULL, '河南省郑州市登封市', '登封市', ',1515,1516,', 1516);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1529, now(), now(), NULL, '河南省开封市', '开封市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1530, now(), now(), NULL, '河南省开封市龙亭区', '龙亭区', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1531, now(), now(), NULL, '河南省开封市顺河回族区', '顺河回族区', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1532, now(), now(), NULL, '河南省开封市鼓楼区', '鼓楼区', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1533, now(), now(), NULL, '河南省开封市禹王台区', '禹王台区', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1534, now(), now(), NULL, '河南省开封市金明区', '金明区', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1535, now(), now(), NULL, '河南省开封市杞县', '杞县', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1536, now(), now(), NULL, '河南省开封市通许县', '通许县', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1537, now(), now(), NULL, '河南省开封市尉氏县', '尉氏县', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1538, now(), now(), NULL, '河南省开封市开封县', '开封县', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1539, now(), now(), NULL, '河南省开封市兰考县', '兰考县', ',1515,1529,', 1529);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1540, now(), now(), NULL, '河南省洛阳市', '洛阳市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1541, now(), now(), NULL, '河南省洛阳市老城区', '老城区', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1542, now(), now(), NULL, '河南省洛阳市西工区', '西工区', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1543, now(), now(), NULL, '河南省洛阳市瀍河回族区', '瀍河回族区', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1544, now(), now(), NULL, '河南省洛阳市涧西区', '涧西区', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1545, now(), now(), NULL, '河南省洛阳市吉利区', '吉利区', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1546, now(), now(), NULL, '河南省洛阳市洛龙区', '洛龙区', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1547, now(), now(), NULL, '河南省洛阳市孟津县', '孟津县', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1548, now(), now(), NULL, '河南省洛阳市新安县', '新安县', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1549, now(), now(), NULL, '河南省洛阳市栾川县', '栾川县', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1550, now(), now(), NULL, '河南省洛阳市嵩县', '嵩县', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1551, now(), now(), NULL, '河南省洛阳市汝阳县', '汝阳县', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1552, now(), now(), NULL, '河南省洛阳市宜阳县', '宜阳县', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1553, now(), now(), NULL, '河南省洛阳市洛宁县', '洛宁县', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1554, now(), now(), NULL, '河南省洛阳市伊川县', '伊川县', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1555, now(), now(), NULL, '河南省洛阳市偃师市', '偃师市', ',1515,1540,', 1540);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1556, now(), now(), NULL, '河南省平顶山市', '平顶山市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1557, now(), now(), NULL, '河南省平顶山市新华区', '新华区', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1558, now(), now(), NULL, '河南省平顶山市卫东区', '卫东区', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1559, now(), now(), NULL, '河南省平顶山市石龙区', '石龙区', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1560, now(), now(), NULL, '河南省平顶山市湛河区', '湛河区', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1561, now(), now(), NULL, '河南省平顶山市宝丰县', '宝丰县', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1562, now(), now(), NULL, '河南省平顶山市叶县', '叶县', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1563, now(), now(), NULL, '河南省平顶山市鲁山县', '鲁山县', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1564, now(), now(), NULL, '河南省平顶山市郏县', '郏县', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1565, now(), now(), NULL, '河南省平顶山市舞钢市', '舞钢市', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1566, now(), now(), NULL, '河南省平顶山市汝州市', '汝州市', ',1515,1556,', 1556);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1567, now(), now(), NULL, '河南省安阳市', '安阳市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1568, now(), now(), NULL, '河南省安阳市文峰区', '文峰区', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1569, now(), now(), NULL, '河南省安阳市北关区', '北关区', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1570, now(), now(), NULL, '河南省安阳市殷都区', '殷都区', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1571, now(), now(), NULL, '河南省安阳市龙安区', '龙安区', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1572, now(), now(), NULL, '河南省安阳市安阳县', '安阳县', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1573, now(), now(), NULL, '河南省安阳市汤阴县', '汤阴县', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1574, now(), now(), NULL, '河南省安阳市滑县', '滑县', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1575, now(), now(), NULL, '河南省安阳市内黄县', '内黄县', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1576, now(), now(), NULL, '河南省安阳市林州市', '林州市', ',1515,1567,', 1567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1577, now(), now(), NULL, '河南省鹤壁市', '鹤壁市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1578, now(), now(), NULL, '河南省鹤壁市鹤山区', '鹤山区', ',1515,1577,', 1577);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1579, now(), now(), NULL, '河南省鹤壁市山城区', '山城区', ',1515,1577,', 1577);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1580, now(), now(), NULL, '河南省鹤壁市淇滨区', '淇滨区', ',1515,1577,', 1577);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1581, now(), now(), NULL, '河南省鹤壁市浚县', '浚县', ',1515,1577,', 1577);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1582, now(), now(), NULL, '河南省鹤壁市淇县', '淇县', ',1515,1577,', 1577);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1583, now(), now(), NULL, '河南省新乡市', '新乡市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1584, now(), now(), NULL, '河南省新乡市红旗区', '红旗区', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1585, now(), now(), NULL, '河南省新乡市卫滨区', '卫滨区', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1586, now(), now(), NULL, '河南省新乡市凤泉区', '凤泉区', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1587, now(), now(), NULL, '河南省新乡市牧野区', '牧野区', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1588, now(), now(), NULL, '河南省新乡市新乡县', '新乡县', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1589, now(), now(), NULL, '河南省新乡市获嘉县', '获嘉县', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1590, now(), now(), NULL, '河南省新乡市原阳县', '原阳县', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1591, now(), now(), NULL, '河南省新乡市延津县', '延津县', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1592, now(), now(), NULL, '河南省新乡市封丘县', '封丘县', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1593, now(), now(), NULL, '河南省新乡市长垣县', '长垣县', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1594, now(), now(), NULL, '河南省新乡市卫辉市', '卫辉市', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1595, now(), now(), NULL, '河南省新乡市辉县市', '辉县市', ',1515,1583,', 1583);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1596, now(), now(), NULL, '河南省焦作市', '焦作市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1597, now(), now(), NULL, '河南省焦作市解放区', '解放区', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1598, now(), now(), NULL, '河南省焦作市中站区', '中站区', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1599, now(), now(), NULL, '河南省焦作市马村区', '马村区', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1600, now(), now(), NULL, '河南省焦作市山阳区', '山阳区', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1601, now(), now(), NULL, '河南省焦作市修武县', '修武县', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1602, now(), now(), NULL, '河南省焦作市博爱县', '博爱县', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1603, now(), now(), NULL, '河南省焦作市武陟县', '武陟县', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1604, now(), now(), NULL, '河南省焦作市温县', '温县', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1605, now(), now(), NULL, '河南省焦作市沁阳市', '沁阳市', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1606, now(), now(), NULL, '河南省焦作市孟州市', '孟州市', ',1515,1596,', 1596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1607, now(), now(), NULL, '河南省濮阳市', '濮阳市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1608, now(), now(), NULL, '河南省濮阳市华龙区', '华龙区', ',1515,1607,', 1607);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1609, now(), now(), NULL, '河南省濮阳市清丰县', '清丰县', ',1515,1607,', 1607);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1610, now(), now(), NULL, '河南省濮阳市南乐县', '南乐县', ',1515,1607,', 1607);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1611, now(), now(), NULL, '河南省濮阳市范县', '范县', ',1515,1607,', 1607);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1612, now(), now(), NULL, '河南省濮阳市台前县', '台前县', ',1515,1607,', 1607);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1613, now(), now(), NULL, '河南省濮阳市濮阳县', '濮阳县', ',1515,1607,', 1607);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1614, now(), now(), NULL, '河南省许昌市', '许昌市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1615, now(), now(), NULL, '河南省许昌市魏都区', '魏都区', ',1515,1614,', 1614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1616, now(), now(), NULL, '河南省许昌市许昌县', '许昌县', ',1515,1614,', 1614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1617, now(), now(), NULL, '河南省许昌市鄢陵县', '鄢陵县', ',1515,1614,', 1614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1618, now(), now(), NULL, '河南省许昌市襄城县', '襄城县', ',1515,1614,', 1614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1619, now(), now(), NULL, '河南省许昌市禹州市', '禹州市', ',1515,1614,', 1614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1620, now(), now(), NULL, '河南省许昌市长葛市', '长葛市', ',1515,1614,', 1614);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1621, now(), now(), NULL, '河南省漯河市', '漯河市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1622, now(), now(), NULL, '河南省漯河市源汇区', '源汇区', ',1515,1621,', 1621);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1623, now(), now(), NULL, '河南省漯河市郾城区', '郾城区', ',1515,1621,', 1621);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1624, now(), now(), NULL, '河南省漯河市召陵区', '召陵区', ',1515,1621,', 1621);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1625, now(), now(), NULL, '河南省漯河市舞阳县', '舞阳县', ',1515,1621,', 1621);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1626, now(), now(), NULL, '河南省漯河市临颍县', '临颍县', ',1515,1621,', 1621);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1627, now(), now(), NULL, '河南省三门峡市', '三门峡市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1628, now(), now(), NULL, '河南省三门峡市湖滨区', '湖滨区', ',1515,1627,', 1627);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1629, now(), now(), NULL, '河南省三门峡市渑池县', '渑池县', ',1515,1627,', 1627);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1630, now(), now(), NULL, '河南省三门峡市陕县', '陕县', ',1515,1627,', 1627);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1631, now(), now(), NULL, '河南省三门峡市卢氏县', '卢氏县', ',1515,1627,', 1627);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1632, now(), now(), NULL, '河南省三门峡市义马市', '义马市', ',1515,1627,', 1627);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1633, now(), now(), NULL, '河南省三门峡市灵宝市', '灵宝市', ',1515,1627,', 1627);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1634, now(), now(), NULL, '河南省南阳市', '南阳市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1635, now(), now(), NULL, '河南省南阳市宛城区', '宛城区', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1636, now(), now(), NULL, '河南省南阳市卧龙区', '卧龙区', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1637, now(), now(), NULL, '河南省南阳市南召县', '南召县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1638, now(), now(), NULL, '河南省南阳市方城县', '方城县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1639, now(), now(), NULL, '河南省南阳市西峡县', '西峡县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1640, now(), now(), NULL, '河南省南阳市镇平县', '镇平县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1641, now(), now(), NULL, '河南省南阳市内乡县', '内乡县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1642, now(), now(), NULL, '河南省南阳市淅川县', '淅川县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1643, now(), now(), NULL, '河南省南阳市社旗县', '社旗县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1644, now(), now(), NULL, '河南省南阳市唐河县', '唐河县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1645, now(), now(), NULL, '河南省南阳市新野县', '新野县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1646, now(), now(), NULL, '河南省南阳市桐柏县', '桐柏县', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1647, now(), now(), NULL, '河南省南阳市邓州市', '邓州市', ',1515,1634,', 1634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1648, now(), now(), NULL, '河南省商丘市', '商丘市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1649, now(), now(), NULL, '河南省商丘市梁园区', '梁园区', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1650, now(), now(), NULL, '河南省商丘市睢阳区', '睢阳区', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1651, now(), now(), NULL, '河南省商丘市民权县', '民权县', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1652, now(), now(), NULL, '河南省商丘市睢县', '睢县', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1653, now(), now(), NULL, '河南省商丘市宁陵县', '宁陵县', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1654, now(), now(), NULL, '河南省商丘市柘城县', '柘城县', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1655, now(), now(), NULL, '河南省商丘市虞城县', '虞城县', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1656, now(), now(), NULL, '河南省商丘市夏邑县', '夏邑县', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1657, now(), now(), NULL, '河南省商丘市永城市', '永城市', ',1515,1648,', 1648);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1658, now(), now(), NULL, '河南省信阳市', '信阳市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1659, now(), now(), NULL, '河南省信阳市浉河区', '浉河区', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1660, now(), now(), NULL, '河南省信阳市平桥区', '平桥区', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1661, now(), now(), NULL, '河南省信阳市罗山县', '罗山县', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1662, now(), now(), NULL, '河南省信阳市光山县', '光山县', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1663, now(), now(), NULL, '河南省信阳市新县', '新县', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1664, now(), now(), NULL, '河南省信阳市商城县', '商城县', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1665, now(), now(), NULL, '河南省信阳市固始县', '固始县', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1666, now(), now(), NULL, '河南省信阳市潢川县', '潢川县', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1667, now(), now(), NULL, '河南省信阳市淮滨县', '淮滨县', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1668, now(), now(), NULL, '河南省信阳市息县', '息县', ',1515,1658,', 1658);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1669, now(), now(), NULL, '河南省周口市', '周口市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1670, now(), now(), NULL, '河南省周口市川汇区', '川汇区', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1671, now(), now(), NULL, '河南省周口市扶沟县', '扶沟县', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1672, now(), now(), NULL, '河南省周口市西华县', '西华县', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1673, now(), now(), NULL, '河南省周口市商水县', '商水县', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1674, now(), now(), NULL, '河南省周口市沈丘县', '沈丘县', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1675, now(), now(), NULL, '河南省周口市郸城县', '郸城县', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1676, now(), now(), NULL, '河南省周口市淮阳县', '淮阳县', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1677, now(), now(), NULL, '河南省周口市太康县', '太康县', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1678, now(), now(), NULL, '河南省周口市鹿邑县', '鹿邑县', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1679, now(), now(), NULL, '河南省周口市项城市', '项城市', ',1515,1669,', 1669);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1680, now(), now(), NULL, '河南省驻马店市', '驻马店市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1681, now(), now(), NULL, '河南省驻马店市驿城区', '驿城区', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1682, now(), now(), NULL, '河南省驻马店市西平县', '西平县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1683, now(), now(), NULL, '河南省驻马店市上蔡县', '上蔡县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1684, now(), now(), NULL, '河南省驻马店市平舆县', '平舆县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1685, now(), now(), NULL, '河南省驻马店市正阳县', '正阳县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1686, now(), now(), NULL, '河南省驻马店市确山县', '确山县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1687, now(), now(), NULL, '河南省驻马店市泌阳县', '泌阳县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1688, now(), now(), NULL, '河南省驻马店市汝南县', '汝南县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1689, now(), now(), NULL, '河南省驻马店市遂平县', '遂平县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1690, now(), now(), NULL, '河南省驻马店市新蔡县', '新蔡县', ',1515,1680,', 1680);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1691, now(), now(), NULL, '河南省济源市', '济源市', ',1515,', 1515);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1692, now(), now(), NULL, '湖北省', '湖北省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1693, now(), now(), NULL, '湖北省武汉市', '武汉市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1694, now(), now(), NULL, '湖北省武汉市江岸区', '江岸区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1695, now(), now(), NULL, '湖北省武汉市江汉区', '江汉区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1696, now(), now(), NULL, '湖北省武汉市硚口区', '硚口区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1697, now(), now(), NULL, '湖北省武汉市汉阳区', '汉阳区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1698, now(), now(), NULL, '湖北省武汉市武昌区', '武昌区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1699, now(), now(), NULL, '湖北省武汉市青山区', '青山区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1700, now(), now(), NULL, '湖北省武汉市洪山区', '洪山区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1701, now(), now(), NULL, '湖北省武汉市东西湖区', '东西湖区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1702, now(), now(), NULL, '湖北省武汉市汉南区', '汉南区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1703, now(), now(), NULL, '湖北省武汉市蔡甸区', '蔡甸区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1704, now(), now(), NULL, '湖北省武汉市江夏区', '江夏区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1705, now(), now(), NULL, '湖北省武汉市黄陂区', '黄陂区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1706, now(), now(), NULL, '湖北省武汉市新洲区', '新洲区', ',1692,1693,', 1693);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1707, now(), now(), NULL, '湖北省黄石市', '黄石市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1708, now(), now(), NULL, '湖北省黄石市黄石港区', '黄石港区', ',1692,1707,', 1707);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1709, now(), now(), NULL, '湖北省黄石市西塞山区', '西塞山区', ',1692,1707,', 1707);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1710, now(), now(), NULL, '湖北省黄石市下陆区', '下陆区', ',1692,1707,', 1707);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1711, now(), now(), NULL, '湖北省黄石市铁山区', '铁山区', ',1692,1707,', 1707);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1712, now(), now(), NULL, '湖北省黄石市阳新县', '阳新县', ',1692,1707,', 1707);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1713, now(), now(), NULL, '湖北省黄石市大冶市', '大冶市', ',1692,1707,', 1707);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1714, now(), now(), NULL, '湖北省十堰市', '十堰市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1715, now(), now(), NULL, '湖北省十堰市茅箭区', '茅箭区', ',1692,1714,', 1714);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1716, now(), now(), NULL, '湖北省十堰市张湾区', '张湾区', ',1692,1714,', 1714);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1717, now(), now(), NULL, '湖北省十堰市郧县', '郧县', ',1692,1714,', 1714);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1718, now(), now(), NULL, '湖北省十堰市郧西县', '郧西县', ',1692,1714,', 1714);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1719, now(), now(), NULL, '湖北省十堰市竹山县', '竹山县', ',1692,1714,', 1714);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1720, now(), now(), NULL, '湖北省十堰市竹溪县', '竹溪县', ',1692,1714,', 1714);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1721, now(), now(), NULL, '湖北省十堰市房县', '房县', ',1692,1714,', 1714);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1722, now(), now(), NULL, '湖北省十堰市丹江口市', '丹江口市', ',1692,1714,', 1714);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1723, now(), now(), NULL, '湖北省宜昌市', '宜昌市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1724, now(), now(), NULL, '湖北省宜昌市西陵区', '西陵区', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1725, now(), now(), NULL, '湖北省宜昌市伍家岗区', '伍家岗区', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1726, now(), now(), NULL, '湖北省宜昌市点军区', '点军区', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1727, now(), now(), NULL, '湖北省宜昌市猇亭区', '猇亭区', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1728, now(), now(), NULL, '湖北省宜昌市夷陵区', '夷陵区', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1729, now(), now(), NULL, '湖北省宜昌市远安县', '远安县', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1730, now(), now(), NULL, '湖北省宜昌市兴山县', '兴山县', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1731, now(), now(), NULL, '湖北省宜昌市秭归县', '秭归县', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1732, now(), now(), NULL, '湖北省宜昌市长阳土家族自治县', '长阳土家族自治县', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1733, now(), now(), NULL, '湖北省宜昌市五峰土家族自治县', '五峰土家族自治县', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1734, now(), now(), NULL, '湖北省宜昌市宜都市', '宜都市', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1735, now(), now(), NULL, '湖北省宜昌市当阳市', '当阳市', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1736, now(), now(), NULL, '湖北省宜昌市枝江市', '枝江市', ',1692,1723,', 1723);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1737, now(), now(), NULL, '湖北省襄阳市', '襄阳市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1738, now(), now(), NULL, '湖北省襄阳市襄城区', '襄城区', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1739, now(), now(), NULL, '湖北省襄阳市樊城区', '樊城区', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1740, now(), now(), NULL, '湖北省襄阳市襄州区', '襄州区', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1741, now(), now(), NULL, '湖北省襄阳市南漳县', '南漳县', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1742, now(), now(), NULL, '湖北省襄阳市谷城县', '谷城县', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1743, now(), now(), NULL, '湖北省襄阳市保康县', '保康县', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1744, now(), now(), NULL, '湖北省襄阳市老河口市', '老河口市', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1745, now(), now(), NULL, '湖北省襄阳市枣阳市', '枣阳市', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1746, now(), now(), NULL, '湖北省襄阳市宜城市', '宜城市', ',1692,1737,', 1737);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1747, now(), now(), NULL, '湖北省鄂州市', '鄂州市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1748, now(), now(), NULL, '湖北省鄂州市梁子湖区', '梁子湖区', ',1692,1747,', 1747);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1749, now(), now(), NULL, '湖北省鄂州市华容区', '华容区', ',1692,1747,', 1747);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1750, now(), now(), NULL, '湖北省鄂州市鄂城区', '鄂城区', ',1692,1747,', 1747);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1751, now(), now(), NULL, '湖北省荆门市', '荆门市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1752, now(), now(), NULL, '湖北省荆门市东宝区', '东宝区', ',1692,1751,', 1751);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1753, now(), now(), NULL, '湖北省荆门市掇刀区', '掇刀区', ',1692,1751,', 1751);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1754, now(), now(), NULL, '湖北省荆门市京山县', '京山县', ',1692,1751,', 1751);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1755, now(), now(), NULL, '湖北省荆门市沙洋县', '沙洋县', ',1692,1751,', 1751);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1756, now(), now(), NULL, '湖北省荆门市钟祥市', '钟祥市', ',1692,1751,', 1751);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1757, now(), now(), NULL, '湖北省孝感市', '孝感市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1758, now(), now(), NULL, '湖北省孝感市孝南区', '孝南区', ',1692,1757,', 1757);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1759, now(), now(), NULL, '湖北省孝感市孝昌县', '孝昌县', ',1692,1757,', 1757);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1760, now(), now(), NULL, '湖北省孝感市大悟县', '大悟县', ',1692,1757,', 1757);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1761, now(), now(), NULL, '湖北省孝感市云梦县', '云梦县', ',1692,1757,', 1757);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1762, now(), now(), NULL, '湖北省孝感市应城市', '应城市', ',1692,1757,', 1757);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1763, now(), now(), NULL, '湖北省孝感市安陆市', '安陆市', ',1692,1757,', 1757);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1764, now(), now(), NULL, '湖北省孝感市汉川市', '汉川市', ',1692,1757,', 1757);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1765, now(), now(), NULL, '湖北省荆州市', '荆州市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1766, now(), now(), NULL, '湖北省荆州市沙市区', '沙市区', ',1692,1765,', 1765);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1767, now(), now(), NULL, '湖北省荆州市荆州区', '荆州区', ',1692,1765,', 1765);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1768, now(), now(), NULL, '湖北省荆州市公安县', '公安县', ',1692,1765,', 1765);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1769, now(), now(), NULL, '湖北省荆州市监利县', '监利县', ',1692,1765,', 1765);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1770, now(), now(), NULL, '湖北省荆州市江陵县', '江陵县', ',1692,1765,', 1765);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1771, now(), now(), NULL, '湖北省荆州市石首市', '石首市', ',1692,1765,', 1765);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1772, now(), now(), NULL, '湖北省荆州市洪湖市', '洪湖市', ',1692,1765,', 1765);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1773, now(), now(), NULL, '湖北省荆州市松滋市', '松滋市', ',1692,1765,', 1765);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1774, now(), now(), NULL, '湖北省黄冈市', '黄冈市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1775, now(), now(), NULL, '湖北省黄冈市黄州区', '黄州区', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1776, now(), now(), NULL, '湖北省黄冈市团风县', '团风县', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1777, now(), now(), NULL, '湖北省黄冈市红安县', '红安县', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1778, now(), now(), NULL, '湖北省黄冈市罗田县', '罗田县', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1779, now(), now(), NULL, '湖北省黄冈市英山县', '英山县', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1780, now(), now(), NULL, '湖北省黄冈市浠水县', '浠水县', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1781, now(), now(), NULL, '湖北省黄冈市蕲春县', '蕲春县', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1782, now(), now(), NULL, '湖北省黄冈市黄梅县', '黄梅县', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1783, now(), now(), NULL, '湖北省黄冈市麻城市', '麻城市', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1784, now(), now(), NULL, '湖北省黄冈市武穴市', '武穴市', ',1692,1774,', 1774);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1785, now(), now(), NULL, '湖北省咸宁市', '咸宁市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1786, now(), now(), NULL, '湖北省咸宁市咸安区', '咸安区', ',1692,1785,', 1785);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1787, now(), now(), NULL, '湖北省咸宁市嘉鱼县', '嘉鱼县', ',1692,1785,', 1785);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1788, now(), now(), NULL, '湖北省咸宁市通城县', '通城县', ',1692,1785,', 1785);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1789, now(), now(), NULL, '湖北省咸宁市崇阳县', '崇阳县', ',1692,1785,', 1785);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1790, now(), now(), NULL, '湖北省咸宁市通山县', '通山县', ',1692,1785,', 1785);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1791, now(), now(), NULL, '湖北省咸宁市赤壁市', '赤壁市', ',1692,1785,', 1785);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1792, now(), now(), NULL, '湖北省随州市', '随州市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1793, now(), now(), NULL, '湖北省随州市曾都区', '曾都区', ',1692,1792,', 1792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1794, now(), now(), NULL, '湖北省随州市随县', '随县', ',1692,1792,', 1792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1795, now(), now(), NULL, '湖北省随州市广水市', '广水市', ',1692,1792,', 1792);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1796, now(), now(), NULL, '湖北省恩施土家族苗族自治州', '恩施土家族苗族自治州', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1797, now(), now(), NULL, '湖北省恩施土家族苗族自治州恩施市', '恩施市', ',1692,1796,', 1796);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1798, now(), now(), NULL, '湖北省恩施土家族苗族自治州利川市', '利川市', ',1692,1796,', 1796);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1799, now(), now(), NULL, '湖北省恩施土家族苗族自治州建始县', '建始县', ',1692,1796,', 1796);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1800, now(), now(), NULL, '湖北省恩施土家族苗族自治州巴东县', '巴东县', ',1692,1796,', 1796);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1801, now(), now(), NULL, '湖北省恩施土家族苗族自治州宣恩县', '宣恩县', ',1692,1796,', 1796);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1802, now(), now(), NULL, '湖北省恩施土家族苗族自治州咸丰县', '咸丰县', ',1692,1796,', 1796);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1803, now(), now(), NULL, '湖北省恩施土家族苗族自治州来凤县', '来凤县', ',1692,1796,', 1796);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1804, now(), now(), NULL, '湖北省恩施土家族苗族自治州鹤峰县', '鹤峰县', ',1692,1796,', 1796);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1805, now(), now(), NULL, '湖北省仙桃市', '仙桃市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1806, now(), now(), NULL, '湖北省潜江市', '潜江市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1807, now(), now(), NULL, '湖北省天门市', '天门市', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1808, now(), now(), NULL, '湖北省神农架林区', '神农架林区', ',1692,', 1692);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1809, now(), now(), NULL, '湖南省', '湖南省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1810, now(), now(), NULL, '湖南省长沙市', '长沙市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1811, now(), now(), NULL, '湖南省长沙市芙蓉区', '芙蓉区', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1812, now(), now(), NULL, '湖南省长沙市天心区', '天心区', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1813, now(), now(), NULL, '湖南省长沙市岳麓区', '岳麓区', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1814, now(), now(), NULL, '湖南省长沙市开福区', '开福区', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1815, now(), now(), NULL, '湖南省长沙市雨花区', '雨花区', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1816, now(), now(), NULL, '湖南省长沙市望城区', '望城区', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1817, now(), now(), NULL, '湖南省长沙市长沙县', '长沙县', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1818, now(), now(), NULL, '湖南省长沙市宁乡县', '宁乡县', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1819, now(), now(), NULL, '湖南省长沙市浏阳市', '浏阳市', ',1809,1810,', 1810);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1820, now(), now(), NULL, '湖南省株洲市', '株洲市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1821, now(), now(), NULL, '湖南省株洲市荷塘区', '荷塘区', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1822, now(), now(), NULL, '湖南省株洲市芦淞区', '芦淞区', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1823, now(), now(), NULL, '湖南省株洲市石峰区', '石峰区', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1824, now(), now(), NULL, '湖南省株洲市天元区', '天元区', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1825, now(), now(), NULL, '湖南省株洲市株洲县', '株洲县', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1826, now(), now(), NULL, '湖南省株洲市攸县', '攸县', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1827, now(), now(), NULL, '湖南省株洲市茶陵县', '茶陵县', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1828, now(), now(), NULL, '湖南省株洲市炎陵县', '炎陵县', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1829, now(), now(), NULL, '湖南省株洲市醴陵市', '醴陵市', ',1809,1820,', 1820);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1830, now(), now(), NULL, '湖南省湘潭市', '湘潭市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1831, now(), now(), NULL, '湖南省湘潭市雨湖区', '雨湖区', ',1809,1830,', 1830);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1832, now(), now(), NULL, '湖南省湘潭市岳塘区', '岳塘区', ',1809,1830,', 1830);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1833, now(), now(), NULL, '湖南省湘潭市湘潭县', '湘潭县', ',1809,1830,', 1830);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1834, now(), now(), NULL, '湖南省湘潭市湘乡市', '湘乡市', ',1809,1830,', 1830);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1835, now(), now(), NULL, '湖南省湘潭市韶山市', '韶山市', ',1809,1830,', 1830);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1836, now(), now(), NULL, '湖南省衡阳市', '衡阳市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1837, now(), now(), NULL, '湖南省衡阳市珠晖区', '珠晖区', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1838, now(), now(), NULL, '湖南省衡阳市雁峰区', '雁峰区', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1839, now(), now(), NULL, '湖南省衡阳市石鼓区', '石鼓区', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1840, now(), now(), NULL, '湖南省衡阳市蒸湘区', '蒸湘区', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1841, now(), now(), NULL, '湖南省衡阳市南岳区', '南岳区', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1842, now(), now(), NULL, '湖南省衡阳市衡阳县', '衡阳县', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1843, now(), now(), NULL, '湖南省衡阳市衡南县', '衡南县', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1844, now(), now(), NULL, '湖南省衡阳市衡山县', '衡山县', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1845, now(), now(), NULL, '湖南省衡阳市衡东县', '衡东县', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1846, now(), now(), NULL, '湖南省衡阳市祁东县', '祁东县', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1847, now(), now(), NULL, '湖南省衡阳市耒阳市', '耒阳市', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1848, now(), now(), NULL, '湖南省衡阳市常宁市', '常宁市', ',1809,1836,', 1836);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1849, now(), now(), NULL, '湖南省邵阳市', '邵阳市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1850, now(), now(), NULL, '湖南省邵阳市双清区', '双清区', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1851, now(), now(), NULL, '湖南省邵阳市大祥区', '大祥区', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1852, now(), now(), NULL, '湖南省邵阳市北塔区', '北塔区', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1853, now(), now(), NULL, '湖南省邵阳市邵东县', '邵东县', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1854, now(), now(), NULL, '湖南省邵阳市新邵县', '新邵县', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1855, now(), now(), NULL, '湖南省邵阳市邵阳县', '邵阳县', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1856, now(), now(), NULL, '湖南省邵阳市隆回县', '隆回县', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1857, now(), now(), NULL, '湖南省邵阳市洞口县', '洞口县', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1858, now(), now(), NULL, '湖南省邵阳市绥宁县', '绥宁县', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1859, now(), now(), NULL, '湖南省邵阳市新宁县', '新宁县', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1860, now(), now(), NULL, '湖南省邵阳市城步苗族自治县', '城步苗族自治县', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1861, now(), now(), NULL, '湖南省邵阳市武冈市', '武冈市', ',1809,1849,', 1849);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1862, now(), now(), NULL, '湖南省岳阳市', '岳阳市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1863, now(), now(), NULL, '湖南省岳阳市岳阳楼区', '岳阳楼区', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1864, now(), now(), NULL, '湖南省岳阳市云溪区', '云溪区', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1865, now(), now(), NULL, '湖南省岳阳市君山区', '君山区', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1866, now(), now(), NULL, '湖南省岳阳市岳阳县', '岳阳县', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1867, now(), now(), NULL, '湖南省岳阳市华容县', '华容县', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1868, now(), now(), NULL, '湖南省岳阳市湘阴县', '湘阴县', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1869, now(), now(), NULL, '湖南省岳阳市平江县', '平江县', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1870, now(), now(), NULL, '湖南省岳阳市汨罗市', '汨罗市', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1871, now(), now(), NULL, '湖南省岳阳市临湘市', '临湘市', ',1809,1862,', 1862);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1872, now(), now(), NULL, '湖南省常德市', '常德市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1873, now(), now(), NULL, '湖南省常德市武陵区', '武陵区', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1874, now(), now(), NULL, '湖南省常德市鼎城区', '鼎城区', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1875, now(), now(), NULL, '湖南省常德市安乡县', '安乡县', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1876, now(), now(), NULL, '湖南省常德市汉寿县', '汉寿县', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1877, now(), now(), NULL, '湖南省常德市澧县', '澧县', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1878, now(), now(), NULL, '湖南省常德市临澧县', '临澧县', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1879, now(), now(), NULL, '湖南省常德市桃源县', '桃源县', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1880, now(), now(), NULL, '湖南省常德市石门县', '石门县', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1881, now(), now(), NULL, '湖南省常德市津市市', '津市市', ',1809,1872,', 1872);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1882, now(), now(), NULL, '湖南省张家界市', '张家界市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1883, now(), now(), NULL, '湖南省张家界市永定区', '永定区', ',1809,1882,', 1882);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1884, now(), now(), NULL, '湖南省张家界市武陵源区', '武陵源区', ',1809,1882,', 1882);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1885, now(), now(), NULL, '湖南省张家界市慈利县', '慈利县', ',1809,1882,', 1882);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1886, now(), now(), NULL, '湖南省张家界市桑植县', '桑植县', ',1809,1882,', 1882);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1887, now(), now(), NULL, '湖南省益阳市', '益阳市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1888, now(), now(), NULL, '湖南省益阳市资阳区', '资阳区', ',1809,1887,', 1887);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1889, now(), now(), NULL, '湖南省益阳市赫山区', '赫山区', ',1809,1887,', 1887);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1890, now(), now(), NULL, '湖南省益阳市南县', '南县', ',1809,1887,', 1887);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1891, now(), now(), NULL, '湖南省益阳市桃江县', '桃江县', ',1809,1887,', 1887);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1892, now(), now(), NULL, '湖南省益阳市安化县', '安化县', ',1809,1887,', 1887);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1893, now(), now(), NULL, '湖南省益阳市沅江市', '沅江市', ',1809,1887,', 1887);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1894, now(), now(), NULL, '湖南省郴州市', '郴州市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1895, now(), now(), NULL, '湖南省郴州市北湖区', '北湖区', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1896, now(), now(), NULL, '湖南省郴州市苏仙区', '苏仙区', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1897, now(), now(), NULL, '湖南省郴州市桂阳县', '桂阳县', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1898, now(), now(), NULL, '湖南省郴州市宜章县', '宜章县', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1899, now(), now(), NULL, '湖南省郴州市永兴县', '永兴县', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1900, now(), now(), NULL, '湖南省郴州市嘉禾县', '嘉禾县', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1901, now(), now(), NULL, '湖南省郴州市临武县', '临武县', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1902, now(), now(), NULL, '湖南省郴州市汝城县', '汝城县', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1903, now(), now(), NULL, '湖南省郴州市桂东县', '桂东县', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1904, now(), now(), NULL, '湖南省郴州市安仁县', '安仁县', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1905, now(), now(), NULL, '湖南省郴州市资兴市', '资兴市', ',1809,1894,', 1894);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1906, now(), now(), NULL, '湖南省永州市', '永州市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1907, now(), now(), NULL, '湖南省永州市零陵区', '零陵区', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1908, now(), now(), NULL, '湖南省永州市冷水滩区', '冷水滩区', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1909, now(), now(), NULL, '湖南省永州市祁阳县', '祁阳县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1910, now(), now(), NULL, '湖南省永州市东安县', '东安县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1911, now(), now(), NULL, '湖南省永州市双牌县', '双牌县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1912, now(), now(), NULL, '湖南省永州市道县', '道县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1913, now(), now(), NULL, '湖南省永州市江永县', '江永县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1914, now(), now(), NULL, '湖南省永州市宁远县', '宁远县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1915, now(), now(), NULL, '湖南省永州市蓝山县', '蓝山县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1916, now(), now(), NULL, '湖南省永州市新田县', '新田县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1917, now(), now(), NULL, '湖南省永州市江华瑶族自治县', '江华瑶族自治县', ',1809,1906,', 1906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1918, now(), now(), NULL, '湖南省怀化市', '怀化市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1919, now(), now(), NULL, '湖南省怀化市鹤城区', '鹤城区', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1920, now(), now(), NULL, '湖南省怀化市中方县', '中方县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1921, now(), now(), NULL, '湖南省怀化市沅陵县', '沅陵县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1922, now(), now(), NULL, '湖南省怀化市辰溪县', '辰溪县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1923, now(), now(), NULL, '湖南省怀化市溆浦县', '溆浦县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1924, now(), now(), NULL, '湖南省怀化市会同县', '会同县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1925, now(), now(), NULL, '湖南省怀化市麻阳苗族自治县', '麻阳苗族自治县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1926, now(), now(), NULL, '湖南省怀化市新晃侗族自治县', '新晃侗族自治县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1927, now(), now(), NULL, '湖南省怀化市芷江侗族自治县', '芷江侗族自治县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1928, now(), now(), NULL, '湖南省怀化市靖州苗族侗族自治县', '靖州苗族侗族自治县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1929, now(), now(), NULL, '湖南省怀化市通道侗族自治县', '通道侗族自治县', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1930, now(), now(), NULL, '湖南省怀化市洪江市', '洪江市', ',1809,1918,', 1918);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1931, now(), now(), NULL, '湖南省娄底市', '娄底市', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1932, now(), now(), NULL, '湖南省娄底市娄星区', '娄星区', ',1809,1931,', 1931);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1933, now(), now(), NULL, '湖南省娄底市双峰县', '双峰县', ',1809,1931,', 1931);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1934, now(), now(), NULL, '湖南省娄底市新化县', '新化县', ',1809,1931,', 1931);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1935, now(), now(), NULL, '湖南省娄底市冷水江市', '冷水江市', ',1809,1931,', 1931);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1936, now(), now(), NULL, '湖南省娄底市涟源市', '涟源市', ',1809,1931,', 1931);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1937, now(), now(), NULL, '湖南省湘西土家族苗族自治州', '湘西土家族苗族自治州', ',1809,', 1809);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1938, now(), now(), NULL, '湖南省湘西土家族苗族自治州吉首市', '吉首市', ',1809,1937,', 1937);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1939, now(), now(), NULL, '湖南省湘西土家族苗族自治州泸溪县', '泸溪县', ',1809,1937,', 1937);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1940, now(), now(), NULL, '湖南省湘西土家族苗族自治州凤凰县', '凤凰县', ',1809,1937,', 1937);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1941, now(), now(), NULL, '湖南省湘西土家族苗族自治州花垣县', '花垣县', ',1809,1937,', 1937);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1942, now(), now(), NULL, '湖南省湘西土家族苗族自治州保靖县', '保靖县', ',1809,1937,', 1937);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1943, now(), now(), NULL, '湖南省湘西土家族苗族自治州古丈县', '古丈县', ',1809,1937,', 1937);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1944, now(), now(), NULL, '湖南省湘西土家族苗族自治州永顺县', '永顺县', ',1809,1937,', 1937);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1945, now(), now(), NULL, '湖南省湘西土家族苗族自治州龙山县', '龙山县', ',1809,1937,', 1937);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1946, now(), now(), NULL, '广东省', '广东省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1947, now(), now(), NULL, '广东省广州市', '广州市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1948, now(), now(), NULL, '广东省广州市荔湾区', '荔湾区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1949, now(), now(), NULL, '广东省广州市越秀区', '越秀区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1950, now(), now(), NULL, '广东省广州市海珠区', '海珠区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1951, now(), now(), NULL, '广东省广州市天河区', '天河区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1952, now(), now(), NULL, '广东省广州市白云区', '白云区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1953, now(), now(), NULL, '广东省广州市黄埔区', '黄埔区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1954, now(), now(), NULL, '广东省广州市番禺区', '番禺区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1955, now(), now(), NULL, '广东省广州市花都区', '花都区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1956, now(), now(), NULL, '广东省广州市南沙区', '南沙区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1957, now(), now(), NULL, '广东省广州市萝岗区', '萝岗区', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1958, now(), now(), NULL, '广东省广州市增城市', '增城市', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1959, now(), now(), NULL, '广东省广州市从化市', '从化市', ',1946,1947,', 1947);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1960, now(), now(), NULL, '广东省韶关市', '韶关市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1961, now(), now(), NULL, '广东省韶关市武江区', '武江区', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1962, now(), now(), NULL, '广东省韶关市浈江区', '浈江区', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1963, now(), now(), NULL, '广东省韶关市曲江区', '曲江区', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1964, now(), now(), NULL, '广东省韶关市始兴县', '始兴县', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1965, now(), now(), NULL, '广东省韶关市仁化县', '仁化县', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1966, now(), now(), NULL, '广东省韶关市翁源县', '翁源县', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1967, now(), now(), NULL, '广东省韶关市乳源瑶族自治县', '乳源瑶族自治县', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1968, now(), now(), NULL, '广东省韶关市新丰县', '新丰县', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1969, now(), now(), NULL, '广东省韶关市乐昌市', '乐昌市', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1970, now(), now(), NULL, '广东省韶关市南雄市', '南雄市', ',1946,1960,', 1960);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1971, now(), now(), NULL, '广东省深圳市', '深圳市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1972, now(), now(), NULL, '广东省深圳市罗湖区', '罗湖区', ',1946,1971,', 1971);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1973, now(), now(), NULL, '广东省深圳市福田区', '福田区', ',1946,1971,', 1971);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1974, now(), now(), NULL, '广东省深圳市南山区', '南山区', ',1946,1971,', 1971);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1975, now(), now(), NULL, '广东省深圳市宝安区', '宝安区', ',1946,1971,', 1971);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1976, now(), now(), NULL, '广东省深圳市龙岗区', '龙岗区', ',1946,1971,', 1971);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1977, now(), now(), NULL, '广东省深圳市盐田区', '盐田区', ',1946,1971,', 1971);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1978, now(), now(), NULL, '广东省珠海市', '珠海市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1979, now(), now(), NULL, '广东省珠海市香洲区', '香洲区', ',1946,1978,', 1978);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1980, now(), now(), NULL, '广东省珠海市斗门区', '斗门区', ',1946,1978,', 1978);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1981, now(), now(), NULL, '广东省珠海市金湾区', '金湾区', ',1946,1978,', 1978);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1982, now(), now(), NULL, '广东省汕头市', '汕头市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1983, now(), now(), NULL, '广东省汕头市龙湖区', '龙湖区', ',1946,1982,', 1982);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1984, now(), now(), NULL, '广东省汕头市金平区', '金平区', ',1946,1982,', 1982);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1985, now(), now(), NULL, '广东省汕头市濠江区', '濠江区', ',1946,1982,', 1982);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1986, now(), now(), NULL, '广东省汕头市潮阳区', '潮阳区', ',1946,1982,', 1982);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1987, now(), now(), NULL, '广东省汕头市潮南区', '潮南区', ',1946,1982,', 1982);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1988, now(), now(), NULL, '广东省汕头市澄海区', '澄海区', ',1946,1982,', 1982);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1989, now(), now(), NULL, '广东省汕头市南澳县', '南澳县', ',1946,1982,', 1982);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1990, now(), now(), NULL, '广东省佛山市', '佛山市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1991, now(), now(), NULL, '广东省佛山市禅城区', '禅城区', ',1946,1990,', 1990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1992, now(), now(), NULL, '广东省佛山市南海区', '南海区', ',1946,1990,', 1990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1993, now(), now(), NULL, '广东省佛山市顺德区', '顺德区', ',1946,1990,', 1990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1994, now(), now(), NULL, '广东省佛山市三水区', '三水区', ',1946,1990,', 1990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1995, now(), now(), NULL, '广东省佛山市高明区', '高明区', ',1946,1990,', 1990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1996, now(), now(), NULL, '广东省江门市', '江门市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1997, now(), now(), NULL, '广东省江门市蓬江区', '蓬江区', ',1946,1996,', 1996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1998, now(), now(), NULL, '广东省江门市江海区', '江海区', ',1946,1996,', 1996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(1999, now(), now(), NULL, '广东省江门市新会区', '新会区', ',1946,1996,', 1996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2000, now(), now(), NULL, '广东省江门市台山市', '台山市', ',1946,1996,', 1996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2001, now(), now(), NULL, '广东省江门市开平市', '开平市', ',1946,1996,', 1996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2002, now(), now(), NULL, '广东省江门市鹤山市', '鹤山市', ',1946,1996,', 1996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2003, now(), now(), NULL, '广东省江门市恩平市', '恩平市', ',1946,1996,', 1996);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2004, now(), now(), NULL, '广东省湛江市', '湛江市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2005, now(), now(), NULL, '广东省湛江市赤坎区', '赤坎区', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2006, now(), now(), NULL, '广东省湛江市霞山区', '霞山区', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2007, now(), now(), NULL, '广东省湛江市坡头区', '坡头区', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2008, now(), now(), NULL, '广东省湛江市麻章区', '麻章区', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2009, now(), now(), NULL, '广东省湛江市遂溪县', '遂溪县', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2010, now(), now(), NULL, '广东省湛江市徐闻县', '徐闻县', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2011, now(), now(), NULL, '广东省湛江市廉江市', '廉江市', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2012, now(), now(), NULL, '广东省湛江市雷州市', '雷州市', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2013, now(), now(), NULL, '广东省湛江市吴川市', '吴川市', ',1946,2004,', 2004);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2014, now(), now(), NULL, '广东省茂名市', '茂名市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2015, now(), now(), NULL, '广东省茂名市茂南区', '茂南区', ',1946,2014,', 2014);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2016, now(), now(), NULL, '广东省茂名市茂港区', '茂港区', ',1946,2014,', 2014);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2017, now(), now(), NULL, '广东省茂名市电白县', '电白县', ',1946,2014,', 2014);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2018, now(), now(), NULL, '广东省茂名市高州市', '高州市', ',1946,2014,', 2014);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2019, now(), now(), NULL, '广东省茂名市化州市', '化州市', ',1946,2014,', 2014);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2020, now(), now(), NULL, '广东省茂名市信宜市', '信宜市', ',1946,2014,', 2014);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2021, now(), now(), NULL, '广东省肇庆市', '肇庆市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2022, now(), now(), NULL, '广东省肇庆市端州区', '端州区', ',1946,2021,', 2021);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2023, now(), now(), NULL, '广东省肇庆市鼎湖区', '鼎湖区', ',1946,2021,', 2021);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2024, now(), now(), NULL, '广东省肇庆市广宁县', '广宁县', ',1946,2021,', 2021);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2025, now(), now(), NULL, '广东省肇庆市怀集县', '怀集县', ',1946,2021,', 2021);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2026, now(), now(), NULL, '广东省肇庆市封开县', '封开县', ',1946,2021,', 2021);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2027, now(), now(), NULL, '广东省肇庆市德庆县', '德庆县', ',1946,2021,', 2021);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2028, now(), now(), NULL, '广东省肇庆市高要市', '高要市', ',1946,2021,', 2021);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2029, now(), now(), NULL, '广东省肇庆市四会市', '四会市', ',1946,2021,', 2021);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2030, now(), now(), NULL, '广东省惠州市', '惠州市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2031, now(), now(), NULL, '广东省惠州市惠城区', '惠城区', ',1946,2030,', 2030);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2032, now(), now(), NULL, '广东省惠州市惠阳区', '惠阳区', ',1946,2030,', 2030);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2033, now(), now(), NULL, '广东省惠州市博罗县', '博罗县', ',1946,2030,', 2030);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2034, now(), now(), NULL, '广东省惠州市惠东县', '惠东县', ',1946,2030,', 2030);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2035, now(), now(), NULL, '广东省惠州市龙门县', '龙门县', ',1946,2030,', 2030);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2036, now(), now(), NULL, '广东省梅州市', '梅州市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2037, now(), now(), NULL, '广东省梅州市梅江区', '梅江区', ',1946,2036,', 2036);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2038, now(), now(), NULL, '广东省梅州市梅县', '梅县', ',1946,2036,', 2036);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2039, now(), now(), NULL, '广东省梅州市大埔县', '大埔县', ',1946,2036,', 2036);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2040, now(), now(), NULL, '广东省梅州市丰顺县', '丰顺县', ',1946,2036,', 2036);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2041, now(), now(), NULL, '广东省梅州市五华县', '五华县', ',1946,2036,', 2036);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2042, now(), now(), NULL, '广东省梅州市平远县', '平远县', ',1946,2036,', 2036);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2043, now(), now(), NULL, '广东省梅州市蕉岭县', '蕉岭县', ',1946,2036,', 2036);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2044, now(), now(), NULL, '广东省梅州市兴宁市', '兴宁市', ',1946,2036,', 2036);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2045, now(), now(), NULL, '广东省汕尾市', '汕尾市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2046, now(), now(), NULL, '广东省汕尾市城区', '城区', ',1946,2045,', 2045);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2047, now(), now(), NULL, '广东省汕尾市海丰县', '海丰县', ',1946,2045,', 2045);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2048, now(), now(), NULL, '广东省汕尾市陆河县', '陆河县', ',1946,2045,', 2045);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2049, now(), now(), NULL, '广东省汕尾市陆丰市', '陆丰市', ',1946,2045,', 2045);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2050, now(), now(), NULL, '广东省河源市', '河源市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2051, now(), now(), NULL, '广东省河源市源城区', '源城区', ',1946,2050,', 2050);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2052, now(), now(), NULL, '广东省河源市紫金县', '紫金县', ',1946,2050,', 2050);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2053, now(), now(), NULL, '广东省河源市龙川县', '龙川县', ',1946,2050,', 2050);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2054, now(), now(), NULL, '广东省河源市连平县', '连平县', ',1946,2050,', 2050);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2055, now(), now(), NULL, '广东省河源市和平县', '和平县', ',1946,2050,', 2050);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2056, now(), now(), NULL, '广东省河源市东源县', '东源县', ',1946,2050,', 2050);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2057, now(), now(), NULL, '广东省阳江市', '阳江市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2058, now(), now(), NULL, '广东省阳江市江城区', '江城区', ',1946,2057,', 2057);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2059, now(), now(), NULL, '广东省阳江市阳西县', '阳西县', ',1946,2057,', 2057);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2060, now(), now(), NULL, '广东省阳江市阳东县', '阳东县', ',1946,2057,', 2057);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2061, now(), now(), NULL, '广东省阳江市阳春市', '阳春市', ',1946,2057,', 2057);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2062, now(), now(), NULL, '广东省清远市', '清远市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2063, now(), now(), NULL, '广东省清远市清城区', '清城区', ',1946,2062,', 2062);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2064, now(), now(), NULL, '广东省清远市佛冈县', '佛冈县', ',1946,2062,', 2062);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2065, now(), now(), NULL, '广东省清远市阳山县', '阳山县', ',1946,2062,', 2062);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2066, now(), now(), NULL, '广东省清远市连山壮族瑶族自治县', '连山壮族瑶族自治县', ',1946,2062,', 2062);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2067, now(), now(), NULL, '广东省清远市连南瑶族自治县', '连南瑶族自治县', ',1946,2062,', 2062);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2068, now(), now(), NULL, '广东省清远市清新县', '清新县', ',1946,2062,', 2062);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2069, now(), now(), NULL, '广东省清远市英德市', '英德市', ',1946,2062,', 2062);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2070, now(), now(), NULL, '广东省清远市连州市', '连州市', ',1946,2062,', 2062);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2071, now(), now(), NULL, '广东省东莞市', '东莞市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2072, now(), now(), NULL, '广东省中山市', '中山市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2073, now(), now(), NULL, '广东省潮州市', '潮州市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2074, now(), now(), NULL, '广东省潮州市湘桥区', '湘桥区', ',1946,2073,', 2073);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2075, now(), now(), NULL, '广东省潮州市潮安县', '潮安县', ',1946,2073,', 2073);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2076, now(), now(), NULL, '广东省潮州市饶平县', '饶平县', ',1946,2073,', 2073);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2077, now(), now(), NULL, '广东省揭阳市', '揭阳市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2078, now(), now(), NULL, '广东省揭阳市榕城区', '榕城区', ',1946,2077,', 2077);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2079, now(), now(), NULL, '广东省揭阳市揭东县', '揭东县', ',1946,2077,', 2077);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2080, now(), now(), NULL, '广东省揭阳市揭西县', '揭西县', ',1946,2077,', 2077);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2081, now(), now(), NULL, '广东省揭阳市惠来县', '惠来县', ',1946,2077,', 2077);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2082, now(), now(), NULL, '广东省揭阳市普宁市', '普宁市', ',1946,2077,', 2077);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2083, now(), now(), NULL, '广东省云浮市', '云浮市', ',1946,', 1946);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2084, now(), now(), NULL, '广东省云浮市云城区', '云城区', ',1946,2083,', 2083);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2085, now(), now(), NULL, '广东省云浮市新兴县', '新兴县', ',1946,2083,', 2083);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2086, now(), now(), NULL, '广东省云浮市郁南县', '郁南县', ',1946,2083,', 2083);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2087, now(), now(), NULL, '广东省云浮市云安县', '云安县', ',1946,2083,', 2083);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2088, now(), now(), NULL, '广东省云浮市罗定市', '罗定市', ',1946,2083,', 2083);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2089, now(), now(), NULL, '广西壮族自治区', '广西壮族自治区', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2090, now(), now(), NULL, '广西壮族自治区南宁市', '南宁市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2091, now(), now(), NULL, '广西壮族自治区南宁市兴宁区', '兴宁区', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2092, now(), now(), NULL, '广西壮族自治区南宁市青秀区', '青秀区', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2093, now(), now(), NULL, '广西壮族自治区南宁市江南区', '江南区', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2094, now(), now(), NULL, '广西壮族自治区南宁市西乡塘区', '西乡塘区', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2095, now(), now(), NULL, '广西壮族自治区南宁市良庆区', '良庆区', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2096, now(), now(), NULL, '广西壮族自治区南宁市邕宁区', '邕宁区', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2097, now(), now(), NULL, '广西壮族自治区南宁市武鸣县', '武鸣县', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2098, now(), now(), NULL, '广西壮族自治区南宁市隆安县', '隆安县', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2099, now(), now(), NULL, '广西壮族自治区南宁市马山县', '马山县', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2100, now(), now(), NULL, '广西壮族自治区南宁市上林县', '上林县', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2101, now(), now(), NULL, '广西壮族自治区南宁市宾阳县', '宾阳县', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2102, now(), now(), NULL, '广西壮族自治区南宁市横县', '横县', ',2089,2090,', 2090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2103, now(), now(), NULL, '广西壮族自治区柳州市', '柳州市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2104, now(), now(), NULL, '广西壮族自治区柳州市城中区', '城中区', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2105, now(), now(), NULL, '广西壮族自治区柳州市鱼峰区', '鱼峰区', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2106, now(), now(), NULL, '广西壮族自治区柳州市柳南区', '柳南区', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2107, now(), now(), NULL, '广西壮族自治区柳州市柳北区', '柳北区', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2108, now(), now(), NULL, '广西壮族自治区柳州市柳江县', '柳江县', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2109, now(), now(), NULL, '广西壮族自治区柳州市柳城县', '柳城县', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2110, now(), now(), NULL, '广西壮族自治区柳州市鹿寨县', '鹿寨县', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2111, now(), now(), NULL, '广西壮族自治区柳州市融安县', '融安县', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2112, now(), now(), NULL, '广西壮族自治区柳州市融水苗族自治县', '融水苗族自治县', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2113, now(), now(), NULL, '广西壮族自治区柳州市三江侗族自治县', '三江侗族自治县', ',2089,2103,', 2103);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2114, now(), now(), NULL, '广西壮族自治区桂林市', '桂林市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2115, now(), now(), NULL, '广西壮族自治区桂林市秀峰区', '秀峰区', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2116, now(), now(), NULL, '广西壮族自治区桂林市叠彩区', '叠彩区', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2117, now(), now(), NULL, '广西壮族自治区桂林市象山区', '象山区', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2118, now(), now(), NULL, '广西壮族自治区桂林市七星区', '七星区', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2119, now(), now(), NULL, '广西壮族自治区桂林市雁山区', '雁山区', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2120, now(), now(), NULL, '广西壮族自治区桂林市阳朔县', '阳朔县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2121, now(), now(), NULL, '广西壮族自治区桂林市临桂县', '临桂县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2122, now(), now(), NULL, '广西壮族自治区桂林市灵川县', '灵川县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2123, now(), now(), NULL, '广西壮族自治区桂林市全州县', '全州县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2124, now(), now(), NULL, '广西壮族自治区桂林市兴安县', '兴安县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2125, now(), now(), NULL, '广西壮族自治区桂林市永福县', '永福县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2126, now(), now(), NULL, '广西壮族自治区桂林市灌阳县', '灌阳县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2127, now(), now(), NULL, '广西壮族自治区桂林市龙胜各族自治县', '龙胜各族自治县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2128, now(), now(), NULL, '广西壮族自治区桂林市资源县', '资源县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2129, now(), now(), NULL, '广西壮族自治区桂林市平乐县', '平乐县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2130, now(), now(), NULL, '广西壮族自治区桂林市荔浦县', '荔浦县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2131, now(), now(), NULL, '广西壮族自治区桂林市恭城瑶族自治县', '恭城瑶族自治县', ',2089,2114,', 2114);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2132, now(), now(), NULL, '广西壮族自治区梧州市', '梧州市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2133, now(), now(), NULL, '广西壮族自治区梧州市万秀区', '万秀区', ',2089,2132,', 2132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2134, now(), now(), NULL, '广西壮族自治区梧州市蝶山区', '蝶山区', ',2089,2132,', 2132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2135, now(), now(), NULL, '广西壮族自治区梧州市长洲区', '长洲区', ',2089,2132,', 2132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2136, now(), now(), NULL, '广西壮族自治区梧州市苍梧县', '苍梧县', ',2089,2132,', 2132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2137, now(), now(), NULL, '广西壮族自治区梧州市藤县', '藤县', ',2089,2132,', 2132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2138, now(), now(), NULL, '广西壮族自治区梧州市蒙山县', '蒙山县', ',2089,2132,', 2132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2139, now(), now(), NULL, '广西壮族自治区梧州市岑溪市', '岑溪市', ',2089,2132,', 2132);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2140, now(), now(), NULL, '广西壮族自治区北海市', '北海市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2141, now(), now(), NULL, '广西壮族自治区北海市海城区', '海城区', ',2089,2140,', 2140);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2142, now(), now(), NULL, '广西壮族自治区北海市银海区', '银海区', ',2089,2140,', 2140);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2143, now(), now(), NULL, '广西壮族自治区北海市铁山港区', '铁山港区', ',2089,2140,', 2140);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2144, now(), now(), NULL, '广西壮族自治区北海市合浦县', '合浦县', ',2089,2140,', 2140);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2145, now(), now(), NULL, '广西壮族自治区防城港市', '防城港市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2146, now(), now(), NULL, '广西壮族自治区防城港市港口区', '港口区', ',2089,2145,', 2145);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2147, now(), now(), NULL, '广西壮族自治区防城港市防城区', '防城区', ',2089,2145,', 2145);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2148, now(), now(), NULL, '广西壮族自治区防城港市上思县', '上思县', ',2089,2145,', 2145);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2149, now(), now(), NULL, '广西壮族自治区防城港市东兴市', '东兴市', ',2089,2145,', 2145);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2150, now(), now(), NULL, '广西壮族自治区钦州市', '钦州市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2151, now(), now(), NULL, '广西壮族自治区钦州市钦南区', '钦南区', ',2089,2150,', 2150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2152, now(), now(), NULL, '广西壮族自治区钦州市钦北区', '钦北区', ',2089,2150,', 2150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2153, now(), now(), NULL, '广西壮族自治区钦州市灵山县', '灵山县', ',2089,2150,', 2150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2154, now(), now(), NULL, '广西壮族自治区钦州市浦北县', '浦北县', ',2089,2150,', 2150);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2155, now(), now(), NULL, '广西壮族自治区贵港市', '贵港市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2156, now(), now(), NULL, '广西壮族自治区贵港市港北区', '港北区', ',2089,2155,', 2155);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2157, now(), now(), NULL, '广西壮族自治区贵港市港南区', '港南区', ',2089,2155,', 2155);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2158, now(), now(), NULL, '广西壮族自治区贵港市覃塘区', '覃塘区', ',2089,2155,', 2155);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2159, now(), now(), NULL, '广西壮族自治区贵港市平南县', '平南县', ',2089,2155,', 2155);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2160, now(), now(), NULL, '广西壮族自治区贵港市桂平市', '桂平市', ',2089,2155,', 2155);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2161, now(), now(), NULL, '广西壮族自治区玉林市', '玉林市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2162, now(), now(), NULL, '广西壮族自治区玉林市玉州区', '玉州区', ',2089,2161,', 2161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2163, now(), now(), NULL, '广西壮族自治区玉林市容县', '容县', ',2089,2161,', 2161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2164, now(), now(), NULL, '广西壮族自治区玉林市陆川县', '陆川县', ',2089,2161,', 2161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2165, now(), now(), NULL, '广西壮族自治区玉林市博白县', '博白县', ',2089,2161,', 2161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2166, now(), now(), NULL, '广西壮族自治区玉林市兴业县', '兴业县', ',2089,2161,', 2161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2167, now(), now(), NULL, '广西壮族自治区玉林市北流市', '北流市', ',2089,2161,', 2161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2168, now(), now(), NULL, '广西壮族自治区百色市', '百色市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2169, now(), now(), NULL, '广西壮族自治区百色市右江区', '右江区', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2170, now(), now(), NULL, '广西壮族自治区百色市田阳县', '田阳县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2171, now(), now(), NULL, '广西壮族自治区百色市田东县', '田东县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2172, now(), now(), NULL, '广西壮族自治区百色市平果县', '平果县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2173, now(), now(), NULL, '广西壮族自治区百色市德保县', '德保县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2174, now(), now(), NULL, '广西壮族自治区百色市靖西县', '靖西县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2175, now(), now(), NULL, '广西壮族自治区百色市那坡县', '那坡县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2176, now(), now(), NULL, '广西壮族自治区百色市凌云县', '凌云县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2177, now(), now(), NULL, '广西壮族自治区百色市乐业县', '乐业县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2178, now(), now(), NULL, '广西壮族自治区百色市田林县', '田林县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2179, now(), now(), NULL, '广西壮族自治区百色市西林县', '西林县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2180, now(), now(), NULL, '广西壮族自治区百色市隆林各族自治县', '隆林各族自治县', ',2089,2168,', 2168);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2181, now(), now(), NULL, '广西壮族自治区贺州市', '贺州市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2182, now(), now(), NULL, '广西壮族自治区贺州市八步区', '八步区', ',2089,2181,', 2181);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2183, now(), now(), NULL, '广西壮族自治区贺州市昭平县', '昭平县', ',2089,2181,', 2181);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2184, now(), now(), NULL, '广西壮族自治区贺州市钟山县', '钟山县', ',2089,2181,', 2181);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2185, now(), now(), NULL, '广西壮族自治区贺州市富川瑶族自治县', '富川瑶族自治县', ',2089,2181,', 2181);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2186, now(), now(), NULL, '广西壮族自治区河池市', '河池市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2187, now(), now(), NULL, '广西壮族自治区河池市金城江区', '金城江区', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2188, now(), now(), NULL, '广西壮族自治区河池市南丹县', '南丹县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2189, now(), now(), NULL, '广西壮族自治区河池市天峨县', '天峨县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2190, now(), now(), NULL, '广西壮族自治区河池市凤山县', '凤山县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2191, now(), now(), NULL, '广西壮族自治区河池市东兰县', '东兰县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2192, now(), now(), NULL, '广西壮族自治区河池市罗城仫佬族自治县', '罗城仫佬族自治县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2193, now(), now(), NULL, '广西壮族自治区河池市环江毛南族自治县', '环江毛南族自治县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2194, now(), now(), NULL, '广西壮族自治区河池市巴马瑶族自治县', '巴马瑶族自治县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2195, now(), now(), NULL, '广西壮族自治区河池市都安瑶族自治县', '都安瑶族自治县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2196, now(), now(), NULL, '广西壮族自治区河池市大化瑶族自治县', '大化瑶族自治县', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2197, now(), now(), NULL, '广西壮族自治区河池市宜州市', '宜州市', ',2089,2186,', 2186);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2198, now(), now(), NULL, '广西壮族自治区来宾市', '来宾市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2199, now(), now(), NULL, '广西壮族自治区来宾市兴宾区', '兴宾区', ',2089,2198,', 2198);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2200, now(), now(), NULL, '广西壮族自治区来宾市忻城县', '忻城县', ',2089,2198,', 2198);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2201, now(), now(), NULL, '广西壮族自治区来宾市象州县', '象州县', ',2089,2198,', 2198);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2202, now(), now(), NULL, '广西壮族自治区来宾市武宣县', '武宣县', ',2089,2198,', 2198);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2203, now(), now(), NULL, '广西壮族自治区来宾市金秀瑶族自治县', '金秀瑶族自治县', ',2089,2198,', 2198);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2204, now(), now(), NULL, '广西壮族自治区来宾市合山市', '合山市', ',2089,2198,', 2198);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2205, now(), now(), NULL, '广西壮族自治区崇左市', '崇左市', ',2089,', 2089);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2206, now(), now(), NULL, '广西壮族自治区崇左市江洲区', '江洲区', ',2089,2205,', 2205);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2207, now(), now(), NULL, '广西壮族自治区崇左市扶绥县', '扶绥县', ',2089,2205,', 2205);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2208, now(), now(), NULL, '广西壮族自治区崇左市宁明县', '宁明县', ',2089,2205,', 2205);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2209, now(), now(), NULL, '广西壮族自治区崇左市龙州县', '龙州县', ',2089,2205,', 2205);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2210, now(), now(), NULL, '广西壮族自治区崇左市大新县', '大新县', ',2089,2205,', 2205);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2211, now(), now(), NULL, '广西壮族自治区崇左市天等县', '天等县', ',2089,2205,', 2205);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2212, now(), now(), NULL, '广西壮族自治区崇左市凭祥市', '凭祥市', ',2089,2205,', 2205);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2213, now(), now(), NULL, '海南省', '海南省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2214, now(), now(), NULL, '海南省海口市', '海口市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2215, now(), now(), NULL, '海南省海口市秀英区', '秀英区', ',2213,2214,', 2214);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2216, now(), now(), NULL, '海南省海口市龙华区', '龙华区', ',2213,2214,', 2214);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2217, now(), now(), NULL, '海南省海口市琼山区', '琼山区', ',2213,2214,', 2214);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2218, now(), now(), NULL, '海南省海口市美兰区', '美兰区', ',2213,2214,', 2214);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2219, now(), now(), NULL, '海南省三亚市', '三亚市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2220, now(), now(), NULL, '海南省三沙市', '三沙市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2221, now(), now(), NULL, '海南省三沙市西沙群岛', '西沙群岛', ',2213,2220,', 2220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2222, now(), now(), NULL, '海南省三沙市南沙群岛', '南沙群岛', ',2213,2220,', 2220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2223, now(), now(), NULL, '海南省三沙市中沙群岛的岛礁及其海域', '中沙群岛的岛礁及其海域', ',2213,2220,', 2220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2224, now(), now(), NULL, '海南省五指山市', '五指山市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2225, now(), now(), NULL, '海南省琼海市', '琼海市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2226, now(), now(), NULL, '海南省儋州市', '儋州市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2227, now(), now(), NULL, '海南省文昌市', '文昌市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2228, now(), now(), NULL, '海南省万宁市', '万宁市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2229, now(), now(), NULL, '海南省东方市', '东方市', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2230, now(), now(), NULL, '海南省定安县', '定安县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2231, now(), now(), NULL, '海南省屯昌县', '屯昌县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2232, now(), now(), NULL, '海南省澄迈县', '澄迈县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2233, now(), now(), NULL, '海南省临高县', '临高县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2234, now(), now(), NULL, '海南省白沙黎族自治县', '白沙黎族自治县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2235, now(), now(), NULL, '海南省昌江黎族自治县', '昌江黎族自治县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2236, now(), now(), NULL, '海南省乐东黎族自治县', '乐东黎族自治县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2237, now(), now(), NULL, '海南省陵水黎族自治县', '陵水黎族自治县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2238, now(), now(), NULL, '海南省保亭黎族苗族自治县', '保亭黎族苗族自治县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2239, now(), now(), NULL, '海南省琼中黎族苗族自治县', '琼中黎族苗族自治县', ',2213,', 2213);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2240, now(), now(), NULL, '重庆市', '重庆市', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2241, now(), now(), NULL, '重庆市万州区', '万州区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2242, now(), now(), NULL, '重庆市涪陵区', '涪陵区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2243, now(), now(), NULL, '重庆市渝中区', '渝中区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2244, now(), now(), NULL, '重庆市大渡口区', '大渡口区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2245, now(), now(), NULL, '重庆市江北区', '江北区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2246, now(), now(), NULL, '重庆市沙坪坝区', '沙坪坝区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2247, now(), now(), NULL, '重庆市九龙坡区', '九龙坡区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2248, now(), now(), NULL, '重庆市南岸区', '南岸区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2249, now(), now(), NULL, '重庆市北碚区', '北碚区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2250, now(), now(), NULL, '重庆市綦江区', '綦江区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2251, now(), now(), NULL, '重庆市大足区', '大足区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2252, now(), now(), NULL, '重庆市渝北区', '渝北区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2253, now(), now(), NULL, '重庆市巴南区', '巴南区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2254, now(), now(), NULL, '重庆市黔江区', '黔江区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2255, now(), now(), NULL, '重庆市长寿区', '长寿区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2256, now(), now(), NULL, '重庆市江津区', '江津区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2257, now(), now(), NULL, '重庆市合川区', '合川区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2258, now(), now(), NULL, '重庆市永川区', '永川区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2259, now(), now(), NULL, '重庆市南川区', '南川区', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2260, now(), now(), NULL, '重庆市潼南县', '潼南县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2261, now(), now(), NULL, '重庆市铜梁县', '铜梁县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2262, now(), now(), NULL, '重庆市荣昌县', '荣昌县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2263, now(), now(), NULL, '重庆市璧山县', '璧山县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2264, now(), now(), NULL, '重庆市梁平县', '梁平县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2265, now(), now(), NULL, '重庆市城口县', '城口县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2266, now(), now(), NULL, '重庆市丰都县', '丰都县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2267, now(), now(), NULL, '重庆市垫江县', '垫江县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2268, now(), now(), NULL, '重庆市武隆县', '武隆县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2269, now(), now(), NULL, '重庆市忠县', '忠县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2270, now(), now(), NULL, '重庆市开县', '开县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2271, now(), now(), NULL, '重庆市云阳县', '云阳县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2272, now(), now(), NULL, '重庆市奉节县', '奉节县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2273, now(), now(), NULL, '重庆市巫山县', '巫山县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2274, now(), now(), NULL, '重庆市巫溪县', '巫溪县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2275, now(), now(), NULL, '重庆市石柱土家族自治县', '石柱土家族自治县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2276, now(), now(), NULL, '重庆市秀山土家族苗族自治县', '秀山土家族苗族自治县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2277, now(), now(), NULL, '重庆市酉阳土家族苗族自治县', '酉阳土家族苗族自治县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2278, now(), now(), NULL, '重庆市彭水苗族土家族自治县', '彭水苗族土家族自治县', ',2240,', 2240);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2279, now(), now(), NULL, '四川省', '四川省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2280, now(), now(), NULL, '四川省成都市', '成都市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2281, now(), now(), NULL, '四川省成都市锦江区', '锦江区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2282, now(), now(), NULL, '四川省成都市青羊区', '青羊区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2283, now(), now(), NULL, '四川省成都市金牛区', '金牛区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2284, now(), now(), NULL, '四川省成都市武侯区', '武侯区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2285, now(), now(), NULL, '四川省成都市成华区', '成华区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2286, now(), now(), NULL, '四川省成都市龙泉驿区', '龙泉驿区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2287, now(), now(), NULL, '四川省成都市青白江区', '青白江区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2288, now(), now(), NULL, '四川省成都市新都区', '新都区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2289, now(), now(), NULL, '四川省成都市温江区', '温江区', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2290, now(), now(), NULL, '四川省成都市金堂县', '金堂县', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2291, now(), now(), NULL, '四川省成都市双流县', '双流县', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2292, now(), now(), NULL, '四川省成都市郫县', '郫县', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2293, now(), now(), NULL, '四川省成都市大邑县', '大邑县', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2294, now(), now(), NULL, '四川省成都市蒲江县', '蒲江县', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2295, now(), now(), NULL, '四川省成都市新津县', '新津县', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2296, now(), now(), NULL, '四川省成都市都江堰市', '都江堰市', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2297, now(), now(), NULL, '四川省成都市彭州市', '彭州市', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2298, now(), now(), NULL, '四川省成都市邛崃市', '邛崃市', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2299, now(), now(), NULL, '四川省成都市崇州市', '崇州市', ',2279,2280,', 2280);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2300, now(), now(), NULL, '四川省自贡市', '自贡市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2301, now(), now(), NULL, '四川省自贡市自流井区', '自流井区', ',2279,2300,', 2300);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2302, now(), now(), NULL, '四川省自贡市贡井区', '贡井区', ',2279,2300,', 2300);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2303, now(), now(), NULL, '四川省自贡市大安区', '大安区', ',2279,2300,', 2300);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2304, now(), now(), NULL, '四川省自贡市沿滩区', '沿滩区', ',2279,2300,', 2300);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2305, now(), now(), NULL, '四川省自贡市荣县', '荣县', ',2279,2300,', 2300);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2306, now(), now(), NULL, '四川省自贡市富顺县', '富顺县', ',2279,2300,', 2300);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2307, now(), now(), NULL, '四川省攀枝花市', '攀枝花市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2308, now(), now(), NULL, '四川省攀枝花市东区', '东区', ',2279,2307,', 2307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2309, now(), now(), NULL, '四川省攀枝花市西区', '西区', ',2279,2307,', 2307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2310, now(), now(), NULL, '四川省攀枝花市仁和区', '仁和区', ',2279,2307,', 2307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2311, now(), now(), NULL, '四川省攀枝花市米易县', '米易县', ',2279,2307,', 2307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2312, now(), now(), NULL, '四川省攀枝花市盐边县', '盐边县', ',2279,2307,', 2307);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2313, now(), now(), NULL, '四川省泸州市', '泸州市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2314, now(), now(), NULL, '四川省泸州市江阳区', '江阳区', ',2279,2313,', 2313);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2315, now(), now(), NULL, '四川省泸州市纳溪区', '纳溪区', ',2279,2313,', 2313);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2316, now(), now(), NULL, '四川省泸州市龙马潭区', '龙马潭区', ',2279,2313,', 2313);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2317, now(), now(), NULL, '四川省泸州市泸县', '泸县', ',2279,2313,', 2313);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2318, now(), now(), NULL, '四川省泸州市合江县', '合江县', ',2279,2313,', 2313);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2319, now(), now(), NULL, '四川省泸州市叙永县', '叙永县', ',2279,2313,', 2313);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2320, now(), now(), NULL, '四川省泸州市古蔺县', '古蔺县', ',2279,2313,', 2313);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2321, now(), now(), NULL, '四川省德阳市', '德阳市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2322, now(), now(), NULL, '四川省德阳市旌阳区', '旌阳区', ',2279,2321,', 2321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2323, now(), now(), NULL, '四川省德阳市中江县', '中江县', ',2279,2321,', 2321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2324, now(), now(), NULL, '四川省德阳市罗江县', '罗江县', ',2279,2321,', 2321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2325, now(), now(), NULL, '四川省德阳市广汉市', '广汉市', ',2279,2321,', 2321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2326, now(), now(), NULL, '四川省德阳市什邡市', '什邡市', ',2279,2321,', 2321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2327, now(), now(), NULL, '四川省德阳市绵竹市', '绵竹市', ',2279,2321,', 2321);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2328, now(), now(), NULL, '四川省绵阳市', '绵阳市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2329, now(), now(), NULL, '四川省绵阳市涪城区', '涪城区', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2330, now(), now(), NULL, '四川省绵阳市游仙区', '游仙区', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2331, now(), now(), NULL, '四川省绵阳市三台县', '三台县', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2332, now(), now(), NULL, '四川省绵阳市盐亭县', '盐亭县', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2333, now(), now(), NULL, '四川省绵阳市安县', '安县', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2334, now(), now(), NULL, '四川省绵阳市梓潼县', '梓潼县', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2335, now(), now(), NULL, '四川省绵阳市北川羌族自治县', '北川羌族自治县', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2336, now(), now(), NULL, '四川省绵阳市平武县', '平武县', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2337, now(), now(), NULL, '四川省绵阳市江油市', '江油市', ',2279,2328,', 2328);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2338, now(), now(), NULL, '四川省广元市', '广元市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2339, now(), now(), NULL, '四川省广元市利州区', '利州区', ',2279,2338,', 2338);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2340, now(), now(), NULL, '四川省广元市元坝区', '元坝区', ',2279,2338,', 2338);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2341, now(), now(), NULL, '四川省广元市朝天区', '朝天区', ',2279,2338,', 2338);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2342, now(), now(), NULL, '四川省广元市旺苍县', '旺苍县', ',2279,2338,', 2338);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2343, now(), now(), NULL, '四川省广元市青川县', '青川县', ',2279,2338,', 2338);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2344, now(), now(), NULL, '四川省广元市剑阁县', '剑阁县', ',2279,2338,', 2338);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2345, now(), now(), NULL, '四川省广元市苍溪县', '苍溪县', ',2279,2338,', 2338);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2346, now(), now(), NULL, '四川省遂宁市', '遂宁市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2347, now(), now(), NULL, '四川省遂宁市船山区', '船山区', ',2279,2346,', 2346);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2348, now(), now(), NULL, '四川省遂宁市安居区', '安居区', ',2279,2346,', 2346);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2349, now(), now(), NULL, '四川省遂宁市蓬溪县', '蓬溪县', ',2279,2346,', 2346);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2350, now(), now(), NULL, '四川省遂宁市射洪县', '射洪县', ',2279,2346,', 2346);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2351, now(), now(), NULL, '四川省遂宁市大英县', '大英县', ',2279,2346,', 2346);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2352, now(), now(), NULL, '四川省内江市', '内江市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2353, now(), now(), NULL, '四川省内江市市中区', '市中区', ',2279,2352,', 2352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2354, now(), now(), NULL, '四川省内江市东兴区', '东兴区', ',2279,2352,', 2352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2355, now(), now(), NULL, '四川省内江市威远县', '威远县', ',2279,2352,', 2352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2356, now(), now(), NULL, '四川省内江市资中县', '资中县', ',2279,2352,', 2352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2357, now(), now(), NULL, '四川省内江市隆昌县', '隆昌县', ',2279,2352,', 2352);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2358, now(), now(), NULL, '四川省乐山市', '乐山市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2359, now(), now(), NULL, '四川省乐山市市中区', '市中区', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2360, now(), now(), NULL, '四川省乐山市沙湾区', '沙湾区', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2361, now(), now(), NULL, '四川省乐山市五通桥区', '五通桥区', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2362, now(), now(), NULL, '四川省乐山市金口河区', '金口河区', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2363, now(), now(), NULL, '四川省乐山市犍为县', '犍为县', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2364, now(), now(), NULL, '四川省乐山市井研县', '井研县', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2365, now(), now(), NULL, '四川省乐山市夹江县', '夹江县', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2366, now(), now(), NULL, '四川省乐山市沐川县', '沐川县', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2367, now(), now(), NULL, '四川省乐山市峨边彝族自治县', '峨边彝族自治县', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2368, now(), now(), NULL, '四川省乐山市马边彝族自治县', '马边彝族自治县', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2369, now(), now(), NULL, '四川省乐山市峨眉山市', '峨眉山市', ',2279,2358,', 2358);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2370, now(), now(), NULL, '四川省南充市', '南充市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2371, now(), now(), NULL, '四川省南充市顺庆区', '顺庆区', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2372, now(), now(), NULL, '四川省南充市高坪区', '高坪区', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2373, now(), now(), NULL, '四川省南充市嘉陵区', '嘉陵区', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2374, now(), now(), NULL, '四川省南充市南部县', '南部县', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2375, now(), now(), NULL, '四川省南充市营山县', '营山县', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2376, now(), now(), NULL, '四川省南充市蓬安县', '蓬安县', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2377, now(), now(), NULL, '四川省南充市仪陇县', '仪陇县', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2378, now(), now(), NULL, '四川省南充市西充县', '西充县', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2379, now(), now(), NULL, '四川省南充市阆中市', '阆中市', ',2279,2370,', 2370);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2380, now(), now(), NULL, '四川省眉山市', '眉山市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2381, now(), now(), NULL, '四川省眉山市东坡区', '东坡区', ',2279,2380,', 2380);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2382, now(), now(), NULL, '四川省眉山市仁寿县', '仁寿县', ',2279,2380,', 2380);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2383, now(), now(), NULL, '四川省眉山市彭山县', '彭山县', ',2279,2380,', 2380);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2384, now(), now(), NULL, '四川省眉山市洪雅县', '洪雅县', ',2279,2380,', 2380);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2385, now(), now(), NULL, '四川省眉山市丹棱县', '丹棱县', ',2279,2380,', 2380);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2386, now(), now(), NULL, '四川省眉山市青神县', '青神县', ',2279,2380,', 2380);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2387, now(), now(), NULL, '四川省宜宾市', '宜宾市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2388, now(), now(), NULL, '四川省宜宾市翠屏区', '翠屏区', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2389, now(), now(), NULL, '四川省宜宾市南溪区', '南溪区', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2390, now(), now(), NULL, '四川省宜宾市宜宾县', '宜宾县', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2391, now(), now(), NULL, '四川省宜宾市江安县', '江安县', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2392, now(), now(), NULL, '四川省宜宾市长宁县', '长宁县', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2393, now(), now(), NULL, '四川省宜宾市高县', '高县', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2394, now(), now(), NULL, '四川省宜宾市珙县', '珙县', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2395, now(), now(), NULL, '四川省宜宾市筠连县', '筠连县', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2396, now(), now(), NULL, '四川省宜宾市兴文县', '兴文县', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2397, now(), now(), NULL, '四川省宜宾市屏山县', '屏山县', ',2279,2387,', 2387);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2398, now(), now(), NULL, '四川省广安市', '广安市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2399, now(), now(), NULL, '四川省广安市广安区', '广安区', ',2279,2398,', 2398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2400, now(), now(), NULL, '四川省广安市岳池县', '岳池县', ',2279,2398,', 2398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2401, now(), now(), NULL, '四川省广安市武胜县', '武胜县', ',2279,2398,', 2398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2402, now(), now(), NULL, '四川省广安市邻水县', '邻水县', ',2279,2398,', 2398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2403, now(), now(), NULL, '四川省广安市华蓥市', '华蓥市', ',2279,2398,', 2398);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2404, now(), now(), NULL, '四川省达州市', '达州市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2405, now(), now(), NULL, '四川省达州市通川区', '通川区', ',2279,2404,', 2404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2406, now(), now(), NULL, '四川省达州市达县', '达县', ',2279,2404,', 2404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2407, now(), now(), NULL, '四川省达州市宣汉县', '宣汉县', ',2279,2404,', 2404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2408, now(), now(), NULL, '四川省达州市开江县', '开江县', ',2279,2404,', 2404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2409, now(), now(), NULL, '四川省达州市大竹县', '大竹县', ',2279,2404,', 2404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2410, now(), now(), NULL, '四川省达州市渠县', '渠县', ',2279,2404,', 2404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2411, now(), now(), NULL, '四川省达州市万源市', '万源市', ',2279,2404,', 2404);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2412, now(), now(), NULL, '四川省雅安市', '雅安市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2413, now(), now(), NULL, '四川省雅安市雨城区', '雨城区', ',2279,2412,', 2412);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2414, now(), now(), NULL, '四川省雅安市名山区', '名山区', ',2279,2412,', 2412);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2415, now(), now(), NULL, '四川省雅安市荥经县', '荥经县', ',2279,2412,', 2412);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2416, now(), now(), NULL, '四川省雅安市汉源县', '汉源县', ',2279,2412,', 2412);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2417, now(), now(), NULL, '四川省雅安市石棉县', '石棉县', ',2279,2412,', 2412);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2418, now(), now(), NULL, '四川省雅安市天全县', '天全县', ',2279,2412,', 2412);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2419, now(), now(), NULL, '四川省雅安市芦山县', '芦山县', ',2279,2412,', 2412);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2420, now(), now(), NULL, '四川省雅安市宝兴县', '宝兴县', ',2279,2412,', 2412);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2421, now(), now(), NULL, '四川省巴中市', '巴中市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2422, now(), now(), NULL, '四川省巴中市巴州区', '巴州区', ',2279,2421,', 2421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2423, now(), now(), NULL, '四川省巴中市通江县', '通江县', ',2279,2421,', 2421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2424, now(), now(), NULL, '四川省巴中市南江县', '南江县', ',2279,2421,', 2421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2425, now(), now(), NULL, '四川省巴中市平昌县', '平昌县', ',2279,2421,', 2421);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2426, now(), now(), NULL, '四川省资阳市', '资阳市', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2427, now(), now(), NULL, '四川省资阳市雁江区', '雁江区', ',2279,2426,', 2426);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2428, now(), now(), NULL, '四川省资阳市安岳县', '安岳县', ',2279,2426,', 2426);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2429, now(), now(), NULL, '四川省资阳市乐至县', '乐至县', ',2279,2426,', 2426);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2430, now(), now(), NULL, '四川省资阳市简阳市', '简阳市', ',2279,2426,', 2426);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2431, now(), now(), NULL, '四川省阿坝藏族羌族自治州', '阿坝藏族羌族自治州', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2432, now(), now(), NULL, '四川省阿坝藏族羌族自治州汶川县', '汶川县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2433, now(), now(), NULL, '四川省阿坝藏族羌族自治州理县', '理县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2434, now(), now(), NULL, '四川省阿坝藏族羌族自治州茂县', '茂县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2435, now(), now(), NULL, '四川省阿坝藏族羌族自治州松潘县', '松潘县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2436, now(), now(), NULL, '四川省阿坝藏族羌族自治州九寨沟县', '九寨沟县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2437, now(), now(), NULL, '四川省阿坝藏族羌族自治州金川县', '金川县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2438, now(), now(), NULL, '四川省阿坝藏族羌族自治州小金县', '小金县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2439, now(), now(), NULL, '四川省阿坝藏族羌族自治州黑水县', '黑水县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2440, now(), now(), NULL, '四川省阿坝藏族羌族自治州马尔康县', '马尔康县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2441, now(), now(), NULL, '四川省阿坝藏族羌族自治州壤塘县', '壤塘县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2442, now(), now(), NULL, '四川省阿坝藏族羌族自治州阿坝县', '阿坝县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2443, now(), now(), NULL, '四川省阿坝藏族羌族自治州若尔盖县', '若尔盖县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2444, now(), now(), NULL, '四川省阿坝藏族羌族自治州红原县', '红原县', ',2279,2431,', 2431);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2445, now(), now(), NULL, '四川省甘孜藏族自治州', '甘孜藏族自治州', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2446, now(), now(), NULL, '四川省甘孜藏族自治州康定县', '康定县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2447, now(), now(), NULL, '四川省甘孜藏族自治州泸定县', '泸定县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2448, now(), now(), NULL, '四川省甘孜藏族自治州丹巴县', '丹巴县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2449, now(), now(), NULL, '四川省甘孜藏族自治州九龙县', '九龙县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2450, now(), now(), NULL, '四川省甘孜藏族自治州雅江县', '雅江县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2451, now(), now(), NULL, '四川省甘孜藏族自治州道孚县', '道孚县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2452, now(), now(), NULL, '四川省甘孜藏族自治州炉霍县', '炉霍县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2453, now(), now(), NULL, '四川省甘孜藏族自治州甘孜县', '甘孜县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2454, now(), now(), NULL, '四川省甘孜藏族自治州新龙县', '新龙县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2455, now(), now(), NULL, '四川省甘孜藏族自治州德格县', '德格县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2456, now(), now(), NULL, '四川省甘孜藏族自治州白玉县', '白玉县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2457, now(), now(), NULL, '四川省甘孜藏族自治州石渠县', '石渠县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2458, now(), now(), NULL, '四川省甘孜藏族自治州色达县', '色达县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2459, now(), now(), NULL, '四川省甘孜藏族自治州理塘县', '理塘县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2460, now(), now(), NULL, '四川省甘孜藏族自治州巴塘县', '巴塘县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2461, now(), now(), NULL, '四川省甘孜藏族自治州乡城县', '乡城县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2462, now(), now(), NULL, '四川省甘孜藏族自治州稻城县', '稻城县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2463, now(), now(), NULL, '四川省甘孜藏族自治州得荣县', '得荣县', ',2279,2445,', 2445);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2464, now(), now(), NULL, '四川省凉山彝族自治州', '凉山彝族自治州', ',2279,', 2279);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2465, now(), now(), NULL, '四川省凉山彝族自治州西昌市', '西昌市', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2466, now(), now(), NULL, '四川省凉山彝族自治州木里藏族自治县', '木里藏族自治县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2467, now(), now(), NULL, '四川省凉山彝族自治州盐源县', '盐源县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2468, now(), now(), NULL, '四川省凉山彝族自治州德昌县', '德昌县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2469, now(), now(), NULL, '四川省凉山彝族自治州会理县', '会理县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2470, now(), now(), NULL, '四川省凉山彝族自治州会东县', '会东县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2471, now(), now(), NULL, '四川省凉山彝族自治州宁南县', '宁南县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2472, now(), now(), NULL, '四川省凉山彝族自治州普格县', '普格县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2473, now(), now(), NULL, '四川省凉山彝族自治州布拖县', '布拖县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2474, now(), now(), NULL, '四川省凉山彝族自治州金阳县', '金阳县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2475, now(), now(), NULL, '四川省凉山彝族自治州昭觉县', '昭觉县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2476, now(), now(), NULL, '四川省凉山彝族自治州喜德县', '喜德县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2477, now(), now(), NULL, '四川省凉山彝族自治州冕宁县', '冕宁县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2478, now(), now(), NULL, '四川省凉山彝族自治州越西县', '越西县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2479, now(), now(), NULL, '四川省凉山彝族自治州甘洛县', '甘洛县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2480, now(), now(), NULL, '四川省凉山彝族自治州美姑县', '美姑县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2481, now(), now(), NULL, '四川省凉山彝族自治州雷波县', '雷波县', ',2279,2464,', 2464);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2482, now(), now(), NULL, '贵州省', '贵州省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2483, now(), now(), NULL, '贵州省贵阳市', '贵阳市', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2484, now(), now(), NULL, '贵州省贵阳市南明区', '南明区', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2485, now(), now(), NULL, '贵州省贵阳市云岩区', '云岩区', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2486, now(), now(), NULL, '贵州省贵阳市花溪区', '花溪区', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2487, now(), now(), NULL, '贵州省贵阳市乌当区', '乌当区', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2488, now(), now(), NULL, '贵州省贵阳市白云区', '白云区', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2489, now(), now(), NULL, '贵州省贵阳市小河区', '小河区', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2490, now(), now(), NULL, '贵州省贵阳市开阳县', '开阳县', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2491, now(), now(), NULL, '贵州省贵阳市息烽县', '息烽县', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2492, now(), now(), NULL, '贵州省贵阳市修文县', '修文县', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2493, now(), now(), NULL, '贵州省贵阳市清镇市', '清镇市', ',2482,2483,', 2483);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2494, now(), now(), NULL, '贵州省六盘水市', '六盘水市', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2495, now(), now(), NULL, '贵州省六盘水市钟山区', '钟山区', ',2482,2494,', 2494);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2496, now(), now(), NULL, '贵州省六盘水市六枝特区', '六枝特区', ',2482,2494,', 2494);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2497, now(), now(), NULL, '贵州省六盘水市水城县', '水城县', ',2482,2494,', 2494);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2498, now(), now(), NULL, '贵州省六盘水市盘县', '盘县', ',2482,2494,', 2494);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2499, now(), now(), NULL, '贵州省遵义市', '遵义市', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2500, now(), now(), NULL, '贵州省遵义市红花岗区', '红花岗区', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2501, now(), now(), NULL, '贵州省遵义市汇川区', '汇川区', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2502, now(), now(), NULL, '贵州省遵义市遵义县', '遵义县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2503, now(), now(), NULL, '贵州省遵义市桐梓县', '桐梓县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2504, now(), now(), NULL, '贵州省遵义市绥阳县', '绥阳县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2505, now(), now(), NULL, '贵州省遵义市正安县', '正安县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2506, now(), now(), NULL, '贵州省遵义市道真仡佬族苗族自治县', '道真仡佬族苗族自治县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2507, now(), now(), NULL, '贵州省遵义市务川仡佬族苗族自治县', '务川仡佬族苗族自治县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2508, now(), now(), NULL, '贵州省遵义市凤冈县', '凤冈县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2509, now(), now(), NULL, '贵州省遵义市湄潭县', '湄潭县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2510, now(), now(), NULL, '贵州省遵义市余庆县', '余庆县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2511, now(), now(), NULL, '贵州省遵义市习水县', '习水县', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2512, now(), now(), NULL, '贵州省遵义市赤水市', '赤水市', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2513, now(), now(), NULL, '贵州省遵义市仁怀市', '仁怀市', ',2482,2499,', 2499);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2514, now(), now(), NULL, '贵州省安顺市', '安顺市', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2515, now(), now(), NULL, '贵州省安顺市西秀区', '西秀区', ',2482,2514,', 2514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2516, now(), now(), NULL, '贵州省安顺市平坝县', '平坝县', ',2482,2514,', 2514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2517, now(), now(), NULL, '贵州省安顺市普定县', '普定县', ',2482,2514,', 2514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2518, now(), now(), NULL, '贵州省安顺市镇宁布依族苗族自治县', '镇宁布依族苗族自治县', ',2482,2514,', 2514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2519, now(), now(), NULL, '贵州省安顺市关岭布依族苗族自治县', '关岭布依族苗族自治县', ',2482,2514,', 2514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2520, now(), now(), NULL, '贵州省安顺市紫云苗族布依族自治县', '紫云苗族布依族自治县', ',2482,2514,', 2514);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2521, now(), now(), NULL, '贵州省毕节市', '毕节市', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2522, now(), now(), NULL, '贵州省毕节市七星关区', '七星关区', ',2482,2521,', 2521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2523, now(), now(), NULL, '贵州省毕节市大方县', '大方县', ',2482,2521,', 2521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2524, now(), now(), NULL, '贵州省毕节市黔西县', '黔西县', ',2482,2521,', 2521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2525, now(), now(), NULL, '贵州省毕节市金沙县', '金沙县', ',2482,2521,', 2521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2526, now(), now(), NULL, '贵州省毕节市织金县', '织金县', ',2482,2521,', 2521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2527, now(), now(), NULL, '贵州省毕节市纳雍县', '纳雍县', ',2482,2521,', 2521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2528, now(), now(), NULL, '贵州省毕节市威宁彝族回族苗族自治县', '威宁彝族回族苗族自治县', ',2482,2521,', 2521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2529, now(), now(), NULL, '贵州省毕节市赫章县', '赫章县', ',2482,2521,', 2521);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2530, now(), now(), NULL, '贵州省铜仁市', '铜仁市', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2531, now(), now(), NULL, '贵州省铜仁市碧江区', '碧江区', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2532, now(), now(), NULL, '贵州省铜仁市万山区', '万山区', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2533, now(), now(), NULL, '贵州省铜仁市江口县', '江口县', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2534, now(), now(), NULL, '贵州省铜仁市玉屏侗族自治县', '玉屏侗族自治县', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2535, now(), now(), NULL, '贵州省铜仁市石阡县', '石阡县', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2536, now(), now(), NULL, '贵州省铜仁市思南县', '思南县', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2537, now(), now(), NULL, '贵州省铜仁市印江土家族苗族自治县', '印江土家族苗族自治县', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2538, now(), now(), NULL, '贵州省铜仁市德江县', '德江县', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2539, now(), now(), NULL, '贵州省铜仁市沿河土家族自治县', '沿河土家族自治县', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2540, now(), now(), NULL, '贵州省铜仁市松桃苗族自治县', '松桃苗族自治县', ',2482,2530,', 2530);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2541, now(), now(), NULL, '贵州省黔西南布依族苗族自治州', '黔西南布依族苗族自治州', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2542, now(), now(), NULL, '贵州省黔西南布依族苗族自治州兴义市', '兴义市', ',2482,2541,', 2541);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2543, now(), now(), NULL, '贵州省黔西南布依族苗族自治州兴仁县', '兴仁县', ',2482,2541,', 2541);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2544, now(), now(), NULL, '贵州省黔西南布依族苗族自治州普安县', '普安县', ',2482,2541,', 2541);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2545, now(), now(), NULL, '贵州省黔西南布依族苗族自治州晴隆县', '晴隆县', ',2482,2541,', 2541);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2546, now(), now(), NULL, '贵州省黔西南布依族苗族自治州贞丰县', '贞丰县', ',2482,2541,', 2541);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2547, now(), now(), NULL, '贵州省黔西南布依族苗族自治州望谟县', '望谟县', ',2482,2541,', 2541);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2548, now(), now(), NULL, '贵州省黔西南布依族苗族自治州册亨县', '册亨县', ',2482,2541,', 2541);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2549, now(), now(), NULL, '贵州省黔西南布依族苗族自治州安龙县', '安龙县', ',2482,2541,', 2541);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2550, now(), now(), NULL, '贵州省黔东南苗族侗族自治州', '黔东南苗族侗族自治州', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2551, now(), now(), NULL, '贵州省黔东南苗族侗族自治州凯里市', '凯里市', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2552, now(), now(), NULL, '贵州省黔东南苗族侗族自治州黄平县', '黄平县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2553, now(), now(), NULL, '贵州省黔东南苗族侗族自治州施秉县', '施秉县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2554, now(), now(), NULL, '贵州省黔东南苗族侗族自治州三穗县', '三穗县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2555, now(), now(), NULL, '贵州省黔东南苗族侗族自治州镇远县', '镇远县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2556, now(), now(), NULL, '贵州省黔东南苗族侗族自治州岑巩县', '岑巩县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2557, now(), now(), NULL, '贵州省黔东南苗族侗族自治州天柱县', '天柱县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2558, now(), now(), NULL, '贵州省黔东南苗族侗族自治州锦屏县', '锦屏县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2559, now(), now(), NULL, '贵州省黔东南苗族侗族自治州剑河县', '剑河县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2560, now(), now(), NULL, '贵州省黔东南苗族侗族自治州台江县', '台江县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2561, now(), now(), NULL, '贵州省黔东南苗族侗族自治州黎平县', '黎平县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2562, now(), now(), NULL, '贵州省黔东南苗族侗族自治州榕江县', '榕江县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2563, now(), now(), NULL, '贵州省黔东南苗族侗族自治州从江县', '从江县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2564, now(), now(), NULL, '贵州省黔东南苗族侗族自治州雷山县', '雷山县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2565, now(), now(), NULL, '贵州省黔东南苗族侗族自治州麻江县', '麻江县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2566, now(), now(), NULL, '贵州省黔东南苗族侗族自治州丹寨县', '丹寨县', ',2482,2550,', 2550);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2567, now(), now(), NULL, '贵州省黔南布依族苗族自治州', '黔南布依族苗族自治州', ',2482,', 2482);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2568, now(), now(), NULL, '贵州省黔南布依族苗族自治州都匀市', '都匀市', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2569, now(), now(), NULL, '贵州省黔南布依族苗族自治州福泉市', '福泉市', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2570, now(), now(), NULL, '贵州省黔南布依族苗族自治州荔波县', '荔波县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2571, now(), now(), NULL, '贵州省黔南布依族苗族自治州贵定县', '贵定县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2572, now(), now(), NULL, '贵州省黔南布依族苗族自治州瓮安县', '瓮安县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2573, now(), now(), NULL, '贵州省黔南布依族苗族自治州独山县', '独山县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2574, now(), now(), NULL, '贵州省黔南布依族苗族自治州平塘县', '平塘县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2575, now(), now(), NULL, '贵州省黔南布依族苗族自治州罗甸县', '罗甸县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2576, now(), now(), NULL, '贵州省黔南布依族苗族自治州长顺县', '长顺县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2577, now(), now(), NULL, '贵州省黔南布依族苗族自治州龙里县', '龙里县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2578, now(), now(), NULL, '贵州省黔南布依族苗族自治州惠水县', '惠水县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2579, now(), now(), NULL, '贵州省黔南布依族苗族自治州三都水族自治县', '三都水族自治县', ',2482,2567,', 2567);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2580, now(), now(), NULL, '云南省', '云南省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2581, now(), now(), NULL, '云南省昆明市', '昆明市', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2582, now(), now(), NULL, '云南省昆明市五华区', '五华区', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2583, now(), now(), NULL, '云南省昆明市盘龙区', '盘龙区', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2584, now(), now(), NULL, '云南省昆明市官渡区', '官渡区', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2585, now(), now(), NULL, '云南省昆明市西山区', '西山区', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2586, now(), now(), NULL, '云南省昆明市东川区', '东川区', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2587, now(), now(), NULL, '云南省昆明市呈贡区', '呈贡区', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2588, now(), now(), NULL, '云南省昆明市晋宁县', '晋宁县', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2589, now(), now(), NULL, '云南省昆明市富民县', '富民县', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2590, now(), now(), NULL, '云南省昆明市宜良县', '宜良县', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2591, now(), now(), NULL, '云南省昆明市石林彝族自治县', '石林彝族自治县', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2592, now(), now(), NULL, '云南省昆明市嵩明县', '嵩明县', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2593, now(), now(), NULL, '云南省昆明市禄劝彝族苗族自治县', '禄劝彝族苗族自治县', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2594, now(), now(), NULL, '云南省昆明市寻甸回族彝族自治县', '寻甸回族彝族自治县', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2595, now(), now(), NULL, '云南省昆明市安宁市', '安宁市', ',2580,2581,', 2581);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2596, now(), now(), NULL, '云南省曲靖市', '曲靖市', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2597, now(), now(), NULL, '云南省曲靖市麒麟区', '麒麟区', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2598, now(), now(), NULL, '云南省曲靖市马龙县', '马龙县', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2599, now(), now(), NULL, '云南省曲靖市陆良县', '陆良县', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2600, now(), now(), NULL, '云南省曲靖市师宗县', '师宗县', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2601, now(), now(), NULL, '云南省曲靖市罗平县', '罗平县', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2602, now(), now(), NULL, '云南省曲靖市富源县', '富源县', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2603, now(), now(), NULL, '云南省曲靖市会泽县', '会泽县', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2604, now(), now(), NULL, '云南省曲靖市沾益县', '沾益县', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2605, now(), now(), NULL, '云南省曲靖市宣威市', '宣威市', ',2580,2596,', 2596);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2606, now(), now(), NULL, '云南省玉溪市', '玉溪市', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2607, now(), now(), NULL, '云南省玉溪市红塔区', '红塔区', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2608, now(), now(), NULL, '云南省玉溪市江川县', '江川县', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2609, now(), now(), NULL, '云南省玉溪市澄江县', '澄江县', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2610, now(), now(), NULL, '云南省玉溪市通海县', '通海县', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2611, now(), now(), NULL, '云南省玉溪市华宁县', '华宁县', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2612, now(), now(), NULL, '云南省玉溪市易门县', '易门县', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2613, now(), now(), NULL, '云南省玉溪市峨山彝族自治县', '峨山彝族自治县', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2614, now(), now(), NULL, '云南省玉溪市新平彝族傣族自治县', '新平彝族傣族自治县', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2615, now(), now(), NULL, '云南省玉溪市元江哈尼族彝族傣族自治县', '元江哈尼族彝族傣族自治县', ',2580,2606,', 2606);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2616, now(), now(), NULL, '云南省保山市', '保山市', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2617, now(), now(), NULL, '云南省保山市隆阳区', '隆阳区', ',2580,2616,', 2616);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2618, now(), now(), NULL, '云南省保山市施甸县', '施甸县', ',2580,2616,', 2616);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2619, now(), now(), NULL, '云南省保山市腾冲县', '腾冲县', ',2580,2616,', 2616);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2620, now(), now(), NULL, '云南省保山市龙陵县', '龙陵县', ',2580,2616,', 2616);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2621, now(), now(), NULL, '云南省保山市昌宁县', '昌宁县', ',2580,2616,', 2616);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2622, now(), now(), NULL, '云南省昭通市', '昭通市', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2623, now(), now(), NULL, '云南省昭通市昭阳区', '昭阳区', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2624, now(), now(), NULL, '云南省昭通市鲁甸县', '鲁甸县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2625, now(), now(), NULL, '云南省昭通市巧家县', '巧家县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2626, now(), now(), NULL, '云南省昭通市盐津县', '盐津县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2627, now(), now(), NULL, '云南省昭通市大关县', '大关县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2628, now(), now(), NULL, '云南省昭通市永善县', '永善县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2629, now(), now(), NULL, '云南省昭通市绥江县', '绥江县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2630, now(), now(), NULL, '云南省昭通市镇雄县', '镇雄县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2631, now(), now(), NULL, '云南省昭通市彝良县', '彝良县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2632, now(), now(), NULL, '云南省昭通市威信县', '威信县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2633, now(), now(), NULL, '云南省昭通市水富县', '水富县', ',2580,2622,', 2622);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2634, now(), now(), NULL, '云南省丽江市', '丽江市', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2635, now(), now(), NULL, '云南省丽江市古城区', '古城区', ',2580,2634,', 2634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2636, now(), now(), NULL, '云南省丽江市玉龙纳西族自治县', '玉龙纳西族自治县', ',2580,2634,', 2634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2637, now(), now(), NULL, '云南省丽江市永胜县', '永胜县', ',2580,2634,', 2634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2638, now(), now(), NULL, '云南省丽江市华坪县', '华坪县', ',2580,2634,', 2634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2639, now(), now(), NULL, '云南省丽江市宁蒗彝族自治县', '宁蒗彝族自治县', ',2580,2634,', 2634);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2640, now(), now(), NULL, '云南省普洱市', '普洱市', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2641, now(), now(), NULL, '云南省普洱市思茅区', '思茅区', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2642, now(), now(), NULL, '云南省普洱市宁洱哈尼族彝族自治县', '宁洱哈尼族彝族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2643, now(), now(), NULL, '云南省普洱市墨江哈尼族自治县', '墨江哈尼族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2644, now(), now(), NULL, '云南省普洱市景东彝族自治县', '景东彝族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2645, now(), now(), NULL, '云南省普洱市景谷傣族彝族自治县', '景谷傣族彝族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2646, now(), now(), NULL, '云南省普洱市镇沅彝族哈尼族拉祜族自治县', '镇沅彝族哈尼族拉祜族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2647, now(), now(), NULL, '云南省普洱市江城哈尼族彝族自治县', '江城哈尼族彝族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2648, now(), now(), NULL, '云南省普洱市孟连傣族拉祜族佤族自治县', '孟连傣族拉祜族佤族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2649, now(), now(), NULL, '云南省普洱市澜沧拉祜族自治县', '澜沧拉祜族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2650, now(), now(), NULL, '云南省普洱市西盟佤族自治县', '西盟佤族自治县', ',2580,2640,', 2640);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2651, now(), now(), NULL, '云南省临沧市', '临沧市', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2652, now(), now(), NULL, '云南省临沧市临翔区', '临翔区', ',2580,2651,', 2651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2653, now(), now(), NULL, '云南省临沧市凤庆县', '凤庆县', ',2580,2651,', 2651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2654, now(), now(), NULL, '云南省临沧市云县', '云县', ',2580,2651,', 2651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2655, now(), now(), NULL, '云南省临沧市永德县', '永德县', ',2580,2651,', 2651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2656, now(), now(), NULL, '云南省临沧市镇康县', '镇康县', ',2580,2651,', 2651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2657, now(), now(), NULL, '云南省临沧市双江拉祜族佤族布朗族傣族自治县', '双江拉祜族佤族布朗族傣族自治县', ',2580,2651,', 2651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2658, now(), now(), NULL, '云南省临沧市耿马傣族佤族自治县', '耿马傣族佤族自治县', ',2580,2651,', 2651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2659, now(), now(), NULL, '云南省临沧市沧源佤族自治县', '沧源佤族自治县', ',2580,2651,', 2651);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2660, now(), now(), NULL, '云南省楚雄彝族自治州', '楚雄彝族自治州', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2661, now(), now(), NULL, '云南省楚雄彝族自治州楚雄市', '楚雄市', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2662, now(), now(), NULL, '云南省楚雄彝族自治州双柏县', '双柏县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2663, now(), now(), NULL, '云南省楚雄彝族自治州牟定县', '牟定县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2664, now(), now(), NULL, '云南省楚雄彝族自治州南华县', '南华县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2665, now(), now(), NULL, '云南省楚雄彝族自治州姚安县', '姚安县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2666, now(), now(), NULL, '云南省楚雄彝族自治州大姚县', '大姚县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2667, now(), now(), NULL, '云南省楚雄彝族自治州永仁县', '永仁县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2668, now(), now(), NULL, '云南省楚雄彝族自治州元谋县', '元谋县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2669, now(), now(), NULL, '云南省楚雄彝族自治州武定县', '武定县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2670, now(), now(), NULL, '云南省楚雄彝族自治州禄丰县', '禄丰县', ',2580,2660,', 2660);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2671, now(), now(), NULL, '云南省红河哈尼族彝族自治州', '红河哈尼族彝族自治州', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2672, now(), now(), NULL, '云南省红河哈尼族彝族自治州个旧市', '个旧市', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2673, now(), now(), NULL, '云南省红河哈尼族彝族自治州开远市', '开远市', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2674, now(), now(), NULL, '云南省红河哈尼族彝族自治州蒙自市', '蒙自市', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2675, now(), now(), NULL, '云南省红河哈尼族彝族自治州屏边苗族自治县', '屏边苗族自治县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2676, now(), now(), NULL, '云南省红河哈尼族彝族自治州建水县', '建水县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2677, now(), now(), NULL, '云南省红河哈尼族彝族自治州石屏县', '石屏县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2678, now(), now(), NULL, '云南省红河哈尼族彝族自治州弥勒县', '弥勒县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2679, now(), now(), NULL, '云南省红河哈尼族彝族自治州泸西县', '泸西县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2680, now(), now(), NULL, '云南省红河哈尼族彝族自治州元阳县', '元阳县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2681, now(), now(), NULL, '云南省红河哈尼族彝族自治州红河县', '红河县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2682, now(), now(), NULL, '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县', '金平苗族瑶族傣族自治县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2683, now(), now(), NULL, '云南省红河哈尼族彝族自治州绿春县', '绿春县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2684, now(), now(), NULL, '云南省红河哈尼族彝族自治州河口瑶族自治县', '河口瑶族自治县', ',2580,2671,', 2671);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2685, now(), now(), NULL, '云南省文山壮族苗族自治州', '文山壮族苗族自治州', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2686, now(), now(), NULL, '云南省文山壮族苗族自治州文山市', '文山市', ',2580,2685,', 2685);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2687, now(), now(), NULL, '云南省文山壮族苗族自治州砚山县', '砚山县', ',2580,2685,', 2685);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2688, now(), now(), NULL, '云南省文山壮族苗族自治州西畴县', '西畴县', ',2580,2685,', 2685);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2689, now(), now(), NULL, '云南省文山壮族苗族自治州麻栗坡县', '麻栗坡县', ',2580,2685,', 2685);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2690, now(), now(), NULL, '云南省文山壮族苗族自治州马关县', '马关县', ',2580,2685,', 2685);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2691, now(), now(), NULL, '云南省文山壮族苗族自治州丘北县', '丘北县', ',2580,2685,', 2685);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2692, now(), now(), NULL, '云南省文山壮族苗族自治州广南县', '广南县', ',2580,2685,', 2685);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2693, now(), now(), NULL, '云南省文山壮族苗族自治州富宁县', '富宁县', ',2580,2685,', 2685);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2694, now(), now(), NULL, '云南省西双版纳傣族自治州', '西双版纳傣族自治州', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2695, now(), now(), NULL, '云南省西双版纳傣族自治州景洪市', '景洪市', ',2580,2694,', 2694);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2696, now(), now(), NULL, '云南省西双版纳傣族自治州勐海县', '勐海县', ',2580,2694,', 2694);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2697, now(), now(), NULL, '云南省西双版纳傣族自治州勐腊县', '勐腊县', ',2580,2694,', 2694);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2698, now(), now(), NULL, '云南省大理白族自治州', '大理白族自治州', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2699, now(), now(), NULL, '云南省大理白族自治州大理市', '大理市', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2700, now(), now(), NULL, '云南省大理白族自治州漾濞彝族自治县', '漾濞彝族自治县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2701, now(), now(), NULL, '云南省大理白族自治州祥云县', '祥云县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2702, now(), now(), NULL, '云南省大理白族自治州宾川县', '宾川县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2703, now(), now(), NULL, '云南省大理白族自治州弥渡县', '弥渡县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2704, now(), now(), NULL, '云南省大理白族自治州南涧彝族自治县', '南涧彝族自治县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2705, now(), now(), NULL, '云南省大理白族自治州巍山彝族回族自治县', '巍山彝族回族自治县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2706, now(), now(), NULL, '云南省大理白族自治州永平县', '永平县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2707, now(), now(), NULL, '云南省大理白族自治州云龙县', '云龙县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2708, now(), now(), NULL, '云南省大理白族自治州洱源县', '洱源县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2709, now(), now(), NULL, '云南省大理白族自治州剑川县', '剑川县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2710, now(), now(), NULL, '云南省大理白族自治州鹤庆县', '鹤庆县', ',2580,2698,', 2698);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2711, now(), now(), NULL, '云南省德宏傣族景颇族自治州', '德宏傣族景颇族自治州', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2712, now(), now(), NULL, '云南省德宏傣族景颇族自治州瑞丽市', '瑞丽市', ',2580,2711,', 2711);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2713, now(), now(), NULL, '云南省德宏傣族景颇族自治州芒市', '芒市', ',2580,2711,', 2711);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2714, now(), now(), NULL, '云南省德宏傣族景颇族自治州梁河县', '梁河县', ',2580,2711,', 2711);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2715, now(), now(), NULL, '云南省德宏傣族景颇族自治州盈江县', '盈江县', ',2580,2711,', 2711);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2716, now(), now(), NULL, '云南省德宏傣族景颇族自治州陇川县', '陇川县', ',2580,2711,', 2711);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2717, now(), now(), NULL, '云南省怒江傈僳族自治州', '怒江傈僳族自治州', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2718, now(), now(), NULL, '云南省怒江傈僳族自治州泸水县', '泸水县', ',2580,2717,', 2717);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2719, now(), now(), NULL, '云南省怒江傈僳族自治州福贡县', '福贡县', ',2580,2717,', 2717);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2720, now(), now(), NULL, '云南省怒江傈僳族自治州贡山独龙族怒族自治县', '贡山独龙族怒族自治县', ',2580,2717,', 2717);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2721, now(), now(), NULL, '云南省怒江傈僳族自治州兰坪白族普米族自治县', '兰坪白族普米族自治县', ',2580,2717,', 2717);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2722, now(), now(), NULL, '云南省迪庆藏族自治州', '迪庆藏族自治州', ',2580,', 2580);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2723, now(), now(), NULL, '云南省迪庆藏族自治州香格里拉县', '香格里拉县', ',2580,2722,', 2722);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2724, now(), now(), NULL, '云南省迪庆藏族自治州德钦县', '德钦县', ',2580,2722,', 2722);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2725, now(), now(), NULL, '云南省迪庆藏族自治州维西傈僳族自治县', '维西傈僳族自治县', ',2580,2722,', 2722);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2726, now(), now(), NULL, '西藏自治区', '西藏自治区', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2727, now(), now(), NULL, '西藏自治区拉萨市', '拉萨市', ',2726,', 2726);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2728, now(), now(), NULL, '西藏自治区拉萨市城关区', '城关区', ',2726,2727,', 2727);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2729, now(), now(), NULL, '西藏自治区拉萨市林周县', '林周县', ',2726,2727,', 2727);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2730, now(), now(), NULL, '西藏自治区拉萨市当雄县', '当雄县', ',2726,2727,', 2727);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2731, now(), now(), NULL, '西藏自治区拉萨市尼木县', '尼木县', ',2726,2727,', 2727);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2732, now(), now(), NULL, '西藏自治区拉萨市曲水县', '曲水县', ',2726,2727,', 2727);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2733, now(), now(), NULL, '西藏自治区拉萨市堆龙德庆县', '堆龙德庆县', ',2726,2727,', 2727);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2734, now(), now(), NULL, '西藏自治区拉萨市达孜县', '达孜县', ',2726,2727,', 2727);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2735, now(), now(), NULL, '西藏自治区拉萨市墨竹工卡县', '墨竹工卡县', ',2726,2727,', 2727);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2736, now(), now(), NULL, '西藏自治区昌都地区', '昌都地区', ',2726,', 2726);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2737, now(), now(), NULL, '西藏自治区昌都地区昌都县', '昌都县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2738, now(), now(), NULL, '西藏自治区昌都地区江达县', '江达县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2739, now(), now(), NULL, '西藏自治区昌都地区贡觉县', '贡觉县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2740, now(), now(), NULL, '西藏自治区昌都地区类乌齐县', '类乌齐县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2741, now(), now(), NULL, '西藏自治区昌都地区丁青县', '丁青县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2742, now(), now(), NULL, '西藏自治区昌都地区察雅县', '察雅县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2743, now(), now(), NULL, '西藏自治区昌都地区八宿县', '八宿县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2744, now(), now(), NULL, '西藏自治区昌都地区左贡县', '左贡县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2745, now(), now(), NULL, '西藏自治区昌都地区芒康县', '芒康县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2746, now(), now(), NULL, '西藏自治区昌都地区洛隆县', '洛隆县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2747, now(), now(), NULL, '西藏自治区昌都地区边坝县', '边坝县', ',2726,2736,', 2736);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2748, now(), now(), NULL, '西藏自治区山南地区', '山南地区', ',2726,', 2726);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2749, now(), now(), NULL, '西藏自治区山南地区乃东县', '乃东县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2750, now(), now(), NULL, '西藏自治区山南地区扎囊县', '扎囊县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2751, now(), now(), NULL, '西藏自治区山南地区贡嘎县', '贡嘎县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2752, now(), now(), NULL, '西藏自治区山南地区桑日县', '桑日县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2753, now(), now(), NULL, '西藏自治区山南地区琼结县', '琼结县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2754, now(), now(), NULL, '西藏自治区山南地区曲松县', '曲松县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2755, now(), now(), NULL, '西藏自治区山南地区措美县', '措美县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2756, now(), now(), NULL, '西藏自治区山南地区洛扎县', '洛扎县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2757, now(), now(), NULL, '西藏自治区山南地区加查县', '加查县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2758, now(), now(), NULL, '西藏自治区山南地区隆子县', '隆子县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2759, now(), now(), NULL, '西藏自治区山南地区错那县', '错那县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2760, now(), now(), NULL, '西藏自治区山南地区浪卡子县', '浪卡子县', ',2726,2748,', 2748);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2761, now(), now(), NULL, '西藏自治区日喀则地区', '日喀则地区', ',2726,', 2726);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2762, now(), now(), NULL, '西藏自治区日喀则地区日喀则市', '日喀则市', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2763, now(), now(), NULL, '西藏自治区日喀则地区南木林县', '南木林县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2764, now(), now(), NULL, '西藏自治区日喀则地区江孜县', '江孜县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2765, now(), now(), NULL, '西藏自治区日喀则地区定日县', '定日县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2766, now(), now(), NULL, '西藏自治区日喀则地区萨迦县', '萨迦县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2767, now(), now(), NULL, '西藏自治区日喀则地区拉孜县', '拉孜县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2768, now(), now(), NULL, '西藏自治区日喀则地区昂仁县', '昂仁县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2769, now(), now(), NULL, '西藏自治区日喀则地区谢通门县', '谢通门县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2770, now(), now(), NULL, '西藏自治区日喀则地区白朗县', '白朗县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2771, now(), now(), NULL, '西藏自治区日喀则地区仁布县', '仁布县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2772, now(), now(), NULL, '西藏自治区日喀则地区康马县', '康马县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2773, now(), now(), NULL, '西藏自治区日喀则地区定结县', '定结县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2774, now(), now(), NULL, '西藏自治区日喀则地区仲巴县', '仲巴县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2775, now(), now(), NULL, '西藏自治区日喀则地区亚东县', '亚东县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2776, now(), now(), NULL, '西藏自治区日喀则地区吉隆县', '吉隆县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2777, now(), now(), NULL, '西藏自治区日喀则地区聂拉木县', '聂拉木县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2778, now(), now(), NULL, '西藏自治区日喀则地区萨嘎县', '萨嘎县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2779, now(), now(), NULL, '西藏自治区日喀则地区岗巴县', '岗巴县', ',2726,2761,', 2761);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2780, now(), now(), NULL, '西藏自治区那曲地区', '那曲地区', ',2726,', 2726);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2781, now(), now(), NULL, '西藏自治区那曲地区那曲县', '那曲县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2782, now(), now(), NULL, '西藏自治区那曲地区嘉黎县', '嘉黎县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2783, now(), now(), NULL, '西藏自治区那曲地区比如县', '比如县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2784, now(), now(), NULL, '西藏自治区那曲地区聂荣县', '聂荣县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2785, now(), now(), NULL, '西藏自治区那曲地区安多县', '安多县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2786, now(), now(), NULL, '西藏自治区那曲地区申扎县', '申扎县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2787, now(), now(), NULL, '西藏自治区那曲地区索县', '索县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2788, now(), now(), NULL, '西藏自治区那曲地区班戈县', '班戈县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2789, now(), now(), NULL, '西藏自治区那曲地区巴青县', '巴青县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2790, now(), now(), NULL, '西藏自治区那曲地区尼玛县', '尼玛县', ',2726,2780,', 2780);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2791, now(), now(), NULL, '西藏自治区阿里地区', '阿里地区', ',2726,', 2726);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2792, now(), now(), NULL, '西藏自治区阿里地区普兰县', '普兰县', ',2726,2791,', 2791);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2793, now(), now(), NULL, '西藏自治区阿里地区札达县', '札达县', ',2726,2791,', 2791);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2794, now(), now(), NULL, '西藏自治区阿里地区噶尔县', '噶尔县', ',2726,2791,', 2791);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2795, now(), now(), NULL, '西藏自治区阿里地区日土县', '日土县', ',2726,2791,', 2791);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2796, now(), now(), NULL, '西藏自治区阿里地区革吉县', '革吉县', ',2726,2791,', 2791);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2797, now(), now(), NULL, '西藏自治区阿里地区改则县', '改则县', ',2726,2791,', 2791);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2798, now(), now(), NULL, '西藏自治区阿里地区措勤县', '措勤县', ',2726,2791,', 2791);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2799, now(), now(), NULL, '西藏自治区林芝地区', '林芝地区', ',2726,', 2726);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2800, now(), now(), NULL, '西藏自治区林芝地区林芝县', '林芝县', ',2726,2799,', 2799);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2801, now(), now(), NULL, '西藏自治区林芝地区工布江达县', '工布江达县', ',2726,2799,', 2799);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2802, now(), now(), NULL, '西藏自治区林芝地区米林县', '米林县', ',2726,2799,', 2799);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2803, now(), now(), NULL, '西藏自治区林芝地区墨脱县', '墨脱县', ',2726,2799,', 2799);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2804, now(), now(), NULL, '西藏自治区林芝地区波密县', '波密县', ',2726,2799,', 2799);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2805, now(), now(), NULL, '西藏自治区林芝地区察隅县', '察隅县', ',2726,2799,', 2799);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2806, now(), now(), NULL, '西藏自治区林芝地区朗县', '朗县', ',2726,2799,', 2799);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2807, now(), now(), NULL, '陕西省', '陕西省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2808, now(), now(), NULL, '陕西省西安市', '西安市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2809, now(), now(), NULL, '陕西省西安市新城区', '新城区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2810, now(), now(), NULL, '陕西省西安市碑林区', '碑林区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2811, now(), now(), NULL, '陕西省西安市莲湖区', '莲湖区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2812, now(), now(), NULL, '陕西省西安市灞桥区', '灞桥区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2813, now(), now(), NULL, '陕西省西安市未央区', '未央区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2814, now(), now(), NULL, '陕西省西安市雁塔区', '雁塔区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2815, now(), now(), NULL, '陕西省西安市阎良区', '阎良区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2816, now(), now(), NULL, '陕西省西安市临潼区', '临潼区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2817, now(), now(), NULL, '陕西省西安市长安区', '长安区', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2818, now(), now(), NULL, '陕西省西安市蓝田县', '蓝田县', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2819, now(), now(), NULL, '陕西省西安市周至县', '周至县', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2820, now(), now(), NULL, '陕西省西安市户县', '户县', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2821, now(), now(), NULL, '陕西省西安市高陵县', '高陵县', ',2807,2808,', 2808);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2822, now(), now(), NULL, '陕西省铜川市', '铜川市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2823, now(), now(), NULL, '陕西省铜川市王益区', '王益区', ',2807,2822,', 2822);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2824, now(), now(), NULL, '陕西省铜川市印台区', '印台区', ',2807,2822,', 2822);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2825, now(), now(), NULL, '陕西省铜川市耀州区', '耀州区', ',2807,2822,', 2822);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2826, now(), now(), NULL, '陕西省铜川市宜君县', '宜君县', ',2807,2822,', 2822);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2827, now(), now(), NULL, '陕西省宝鸡市', '宝鸡市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2828, now(), now(), NULL, '陕西省宝鸡市渭滨区', '渭滨区', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2829, now(), now(), NULL, '陕西省宝鸡市金台区', '金台区', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2830, now(), now(), NULL, '陕西省宝鸡市陈仓区', '陈仓区', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2831, now(), now(), NULL, '陕西省宝鸡市凤翔县', '凤翔县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2832, now(), now(), NULL, '陕西省宝鸡市岐山县', '岐山县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2833, now(), now(), NULL, '陕西省宝鸡市扶风县', '扶风县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2834, now(), now(), NULL, '陕西省宝鸡市眉县', '眉县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2835, now(), now(), NULL, '陕西省宝鸡市陇县', '陇县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2836, now(), now(), NULL, '陕西省宝鸡市千阳县', '千阳县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2837, now(), now(), NULL, '陕西省宝鸡市麟游县', '麟游县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2838, now(), now(), NULL, '陕西省宝鸡市凤县', '凤县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2839, now(), now(), NULL, '陕西省宝鸡市太白县', '太白县', ',2807,2827,', 2827);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2840, now(), now(), NULL, '陕西省咸阳市', '咸阳市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2841, now(), now(), NULL, '陕西省咸阳市秦都区', '秦都区', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2842, now(), now(), NULL, '陕西省咸阳市杨陵区', '杨陵区', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2843, now(), now(), NULL, '陕西省咸阳市渭城区', '渭城区', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2844, now(), now(), NULL, '陕西省咸阳市三原县', '三原县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2845, now(), now(), NULL, '陕西省咸阳市泾阳县', '泾阳县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2846, now(), now(), NULL, '陕西省咸阳市乾县', '乾县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2847, now(), now(), NULL, '陕西省咸阳市礼泉县', '礼泉县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2848, now(), now(), NULL, '陕西省咸阳市永寿县', '永寿县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2849, now(), now(), NULL, '陕西省咸阳市彬县', '彬县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2850, now(), now(), NULL, '陕西省咸阳市长武县', '长武县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2851, now(), now(), NULL, '陕西省咸阳市旬邑县', '旬邑县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2852, now(), now(), NULL, '陕西省咸阳市淳化县', '淳化县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2853, now(), now(), NULL, '陕西省咸阳市武功县', '武功县', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2854, now(), now(), NULL, '陕西省咸阳市兴平市', '兴平市', ',2807,2840,', 2840);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2855, now(), now(), NULL, '陕西省渭南市', '渭南市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2856, now(), now(), NULL, '陕西省渭南市临渭区', '临渭区', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2857, now(), now(), NULL, '陕西省渭南市华县', '华县', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2858, now(), now(), NULL, '陕西省渭南市潼关县', '潼关县', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2859, now(), now(), NULL, '陕西省渭南市大荔县', '大荔县', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2860, now(), now(), NULL, '陕西省渭南市合阳县', '合阳县', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2861, now(), now(), NULL, '陕西省渭南市澄城县', '澄城县', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2862, now(), now(), NULL, '陕西省渭南市蒲城县', '蒲城县', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2863, now(), now(), NULL, '陕西省渭南市白水县', '白水县', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2864, now(), now(), NULL, '陕西省渭南市富平县', '富平县', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2865, now(), now(), NULL, '陕西省渭南市韩城市', '韩城市', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2866, now(), now(), NULL, '陕西省渭南市华阴市', '华阴市', ',2807,2855,', 2855);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2867, now(), now(), NULL, '陕西省延安市', '延安市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2868, now(), now(), NULL, '陕西省延安市宝塔区', '宝塔区', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2869, now(), now(), NULL, '陕西省延安市延长县', '延长县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2870, now(), now(), NULL, '陕西省延安市延川县', '延川县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2871, now(), now(), NULL, '陕西省延安市子长县', '子长县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2872, now(), now(), NULL, '陕西省延安市安塞县', '安塞县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2873, now(), now(), NULL, '陕西省延安市志丹县', '志丹县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2874, now(), now(), NULL, '陕西省延安市吴起县', '吴起县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2875, now(), now(), NULL, '陕西省延安市甘泉县', '甘泉县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2876, now(), now(), NULL, '陕西省延安市富县', '富县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2877, now(), now(), NULL, '陕西省延安市洛川县', '洛川县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2878, now(), now(), NULL, '陕西省延安市宜川县', '宜川县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2879, now(), now(), NULL, '陕西省延安市黄龙县', '黄龙县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2880, now(), now(), NULL, '陕西省延安市黄陵县', '黄陵县', ',2807,2867,', 2867);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2881, now(), now(), NULL, '陕西省汉中市', '汉中市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2882, now(), now(), NULL, '陕西省汉中市汉台区', '汉台区', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2883, now(), now(), NULL, '陕西省汉中市南郑县', '南郑县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2884, now(), now(), NULL, '陕西省汉中市城固县', '城固县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2885, now(), now(), NULL, '陕西省汉中市洋县', '洋县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2886, now(), now(), NULL, '陕西省汉中市西乡县', '西乡县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2887, now(), now(), NULL, '陕西省汉中市勉县', '勉县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2888, now(), now(), NULL, '陕西省汉中市宁强县', '宁强县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2889, now(), now(), NULL, '陕西省汉中市略阳县', '略阳县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2890, now(), now(), NULL, '陕西省汉中市镇巴县', '镇巴县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2891, now(), now(), NULL, '陕西省汉中市留坝县', '留坝县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2892, now(), now(), NULL, '陕西省汉中市佛坪县', '佛坪县', ',2807,2881,', 2881);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2893, now(), now(), NULL, '陕西省榆林市', '榆林市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2894, now(), now(), NULL, '陕西省榆林市榆阳区', '榆阳区', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2895, now(), now(), NULL, '陕西省榆林市神木县', '神木县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2896, now(), now(), NULL, '陕西省榆林市府谷县', '府谷县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2897, now(), now(), NULL, '陕西省榆林市横山县', '横山县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2898, now(), now(), NULL, '陕西省榆林市靖边县', '靖边县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2899, now(), now(), NULL, '陕西省榆林市定边县', '定边县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2900, now(), now(), NULL, '陕西省榆林市绥德县', '绥德县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2901, now(), now(), NULL, '陕西省榆林市米脂县', '米脂县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2902, now(), now(), NULL, '陕西省榆林市佳县', '佳县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2903, now(), now(), NULL, '陕西省榆林市吴堡县', '吴堡县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2904, now(), now(), NULL, '陕西省榆林市清涧县', '清涧县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2905, now(), now(), NULL, '陕西省榆林市子洲县', '子洲县', ',2807,2893,', 2893);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2906, now(), now(), NULL, '陕西省安康市', '安康市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2907, now(), now(), NULL, '陕西省安康市汉滨区', '汉滨区', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2908, now(), now(), NULL, '陕西省安康市汉阴县', '汉阴县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2909, now(), now(), NULL, '陕西省安康市石泉县', '石泉县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2910, now(), now(), NULL, '陕西省安康市宁陕县', '宁陕县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2911, now(), now(), NULL, '陕西省安康市紫阳县', '紫阳县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2912, now(), now(), NULL, '陕西省安康市岚皋县', '岚皋县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2913, now(), now(), NULL, '陕西省安康市平利县', '平利县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2914, now(), now(), NULL, '陕西省安康市镇坪县', '镇坪县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2915, now(), now(), NULL, '陕西省安康市旬阳县', '旬阳县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2916, now(), now(), NULL, '陕西省安康市白河县', '白河县', ',2807,2906,', 2906);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2917, now(), now(), NULL, '陕西省商洛市', '商洛市', ',2807,', 2807);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2918, now(), now(), NULL, '陕西省商洛市商州区', '商州区', ',2807,2917,', 2917);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2919, now(), now(), NULL, '陕西省商洛市洛南县', '洛南县', ',2807,2917,', 2917);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2920, now(), now(), NULL, '陕西省商洛市丹凤县', '丹凤县', ',2807,2917,', 2917);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2921, now(), now(), NULL, '陕西省商洛市商南县', '商南县', ',2807,2917,', 2917);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2922, now(), now(), NULL, '陕西省商洛市山阳县', '山阳县', ',2807,2917,', 2917);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2923, now(), now(), NULL, '陕西省商洛市镇安县', '镇安县', ',2807,2917,', 2917);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2924, now(), now(), NULL, '陕西省商洛市柞水县', '柞水县', ',2807,2917,', 2917);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2925, now(), now(), NULL, '甘肃省', '甘肃省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2926, now(), now(), NULL, '甘肃省兰州市', '兰州市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2927, now(), now(), NULL, '甘肃省兰州市城关区', '城关区', ',2925,2926,', 2926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2928, now(), now(), NULL, '甘肃省兰州市七里河区', '七里河区', ',2925,2926,', 2926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2929, now(), now(), NULL, '甘肃省兰州市西固区', '西固区', ',2925,2926,', 2926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2930, now(), now(), NULL, '甘肃省兰州市安宁区', '安宁区', ',2925,2926,', 2926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2931, now(), now(), NULL, '甘肃省兰州市红古区', '红古区', ',2925,2926,', 2926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2932, now(), now(), NULL, '甘肃省兰州市永登县', '永登县', ',2925,2926,', 2926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2933, now(), now(), NULL, '甘肃省兰州市皋兰县', '皋兰县', ',2925,2926,', 2926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2934, now(), now(), NULL, '甘肃省兰州市榆中县', '榆中县', ',2925,2926,', 2926);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2935, now(), now(), NULL, '甘肃省嘉峪关市', '嘉峪关市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2936, now(), now(), NULL, '甘肃省金昌市', '金昌市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2937, now(), now(), NULL, '甘肃省金昌市金川区', '金川区', ',2925,2936,', 2936);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2938, now(), now(), NULL, '甘肃省金昌市永昌县', '永昌县', ',2925,2936,', 2936);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2939, now(), now(), NULL, '甘肃省白银市', '白银市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2940, now(), now(), NULL, '甘肃省白银市白银区', '白银区', ',2925,2939,', 2939);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2941, now(), now(), NULL, '甘肃省白银市平川区', '平川区', ',2925,2939,', 2939);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2942, now(), now(), NULL, '甘肃省白银市靖远县', '靖远县', ',2925,2939,', 2939);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2943, now(), now(), NULL, '甘肃省白银市会宁县', '会宁县', ',2925,2939,', 2939);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2944, now(), now(), NULL, '甘肃省白银市景泰县', '景泰县', ',2925,2939,', 2939);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2945, now(), now(), NULL, '甘肃省天水市', '天水市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2946, now(), now(), NULL, '甘肃省天水市秦州区', '秦州区', ',2925,2945,', 2945);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2947, now(), now(), NULL, '甘肃省天水市麦积区', '麦积区', ',2925,2945,', 2945);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2948, now(), now(), NULL, '甘肃省天水市清水县', '清水县', ',2925,2945,', 2945);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2949, now(), now(), NULL, '甘肃省天水市秦安县', '秦安县', ',2925,2945,', 2945);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2950, now(), now(), NULL, '甘肃省天水市甘谷县', '甘谷县', ',2925,2945,', 2945);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2951, now(), now(), NULL, '甘肃省天水市武山县', '武山县', ',2925,2945,', 2945);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2952, now(), now(), NULL, '甘肃省天水市张家川回族自治县', '张家川回族自治县', ',2925,2945,', 2945);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2953, now(), now(), NULL, '甘肃省武威市', '武威市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2954, now(), now(), NULL, '甘肃省武威市凉州区', '凉州区', ',2925,2953,', 2953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2955, now(), now(), NULL, '甘肃省武威市民勤县', '民勤县', ',2925,2953,', 2953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2956, now(), now(), NULL, '甘肃省武威市古浪县', '古浪县', ',2925,2953,', 2953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2957, now(), now(), NULL, '甘肃省武威市天祝藏族自治县', '天祝藏族自治县', ',2925,2953,', 2953);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2958, now(), now(), NULL, '甘肃省张掖市', '张掖市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2959, now(), now(), NULL, '甘肃省张掖市甘州区', '甘州区', ',2925,2958,', 2958);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2960, now(), now(), NULL, '甘肃省张掖市肃南裕固族自治县', '肃南裕固族自治县', ',2925,2958,', 2958);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2961, now(), now(), NULL, '甘肃省张掖市民乐县', '民乐县', ',2925,2958,', 2958);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2962, now(), now(), NULL, '甘肃省张掖市临泽县', '临泽县', ',2925,2958,', 2958);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2963, now(), now(), NULL, '甘肃省张掖市高台县', '高台县', ',2925,2958,', 2958);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2964, now(), now(), NULL, '甘肃省张掖市山丹县', '山丹县', ',2925,2958,', 2958);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2965, now(), now(), NULL, '甘肃省平凉市', '平凉市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2966, now(), now(), NULL, '甘肃省平凉市崆峒区', '崆峒区', ',2925,2965,', 2965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2967, now(), now(), NULL, '甘肃省平凉市泾川县', '泾川县', ',2925,2965,', 2965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2968, now(), now(), NULL, '甘肃省平凉市灵台县', '灵台县', ',2925,2965,', 2965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2969, now(), now(), NULL, '甘肃省平凉市崇信县', '崇信县', ',2925,2965,', 2965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2970, now(), now(), NULL, '甘肃省平凉市华亭县', '华亭县', ',2925,2965,', 2965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2971, now(), now(), NULL, '甘肃省平凉市庄浪县', '庄浪县', ',2925,2965,', 2965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2972, now(), now(), NULL, '甘肃省平凉市静宁县', '静宁县', ',2925,2965,', 2965);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2973, now(), now(), NULL, '甘肃省酒泉市', '酒泉市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2974, now(), now(), NULL, '甘肃省酒泉市肃州区', '肃州区', ',2925,2973,', 2973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2975, now(), now(), NULL, '甘肃省酒泉市金塔县', '金塔县', ',2925,2973,', 2973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2976, now(), now(), NULL, '甘肃省酒泉市瓜州县', '瓜州县', ',2925,2973,', 2973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2977, now(), now(), NULL, '甘肃省酒泉市肃北蒙古族自治县', '肃北蒙古族自治县', ',2925,2973,', 2973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2978, now(), now(), NULL, '甘肃省酒泉市阿克塞哈萨克族自治县', '阿克塞哈萨克族自治县', ',2925,2973,', 2973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2979, now(), now(), NULL, '甘肃省酒泉市玉门市', '玉门市', ',2925,2973,', 2973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2980, now(), now(), NULL, '甘肃省酒泉市敦煌市', '敦煌市', ',2925,2973,', 2973);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2981, now(), now(), NULL, '甘肃省庆阳市', '庆阳市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2982, now(), now(), NULL, '甘肃省庆阳市西峰区', '西峰区', ',2925,2981,', 2981);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2983, now(), now(), NULL, '甘肃省庆阳市庆城县', '庆城县', ',2925,2981,', 2981);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2984, now(), now(), NULL, '甘肃省庆阳市环县', '环县', ',2925,2981,', 2981);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2985, now(), now(), NULL, '甘肃省庆阳市华池县', '华池县', ',2925,2981,', 2981);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2986, now(), now(), NULL, '甘肃省庆阳市合水县', '合水县', ',2925,2981,', 2981);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2987, now(), now(), NULL, '甘肃省庆阳市正宁县', '正宁县', ',2925,2981,', 2981);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2988, now(), now(), NULL, '甘肃省庆阳市宁县', '宁县', ',2925,2981,', 2981);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2989, now(), now(), NULL, '甘肃省庆阳市镇原县', '镇原县', ',2925,2981,', 2981);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2990, now(), now(), NULL, '甘肃省定西市', '定西市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2991, now(), now(), NULL, '甘肃省定西市安定区', '安定区', ',2925,2990,', 2990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2992, now(), now(), NULL, '甘肃省定西市通渭县', '通渭县', ',2925,2990,', 2990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2993, now(), now(), NULL, '甘肃省定西市陇西县', '陇西县', ',2925,2990,', 2990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2994, now(), now(), NULL, '甘肃省定西市渭源县', '渭源县', ',2925,2990,', 2990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2995, now(), now(), NULL, '甘肃省定西市临洮县', '临洮县', ',2925,2990,', 2990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2996, now(), now(), NULL, '甘肃省定西市漳县', '漳县', ',2925,2990,', 2990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2997, now(), now(), NULL, '甘肃省定西市岷县', '岷县', ',2925,2990,', 2990);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2998, now(), now(), NULL, '甘肃省陇南市', '陇南市', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(2999, now(), now(), NULL, '甘肃省陇南市武都区', '武都区', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3000, now(), now(), NULL, '甘肃省陇南市成县', '成县', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3001, now(), now(), NULL, '甘肃省陇南市文县', '文县', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3002, now(), now(), NULL, '甘肃省陇南市宕昌县', '宕昌县', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3003, now(), now(), NULL, '甘肃省陇南市康县', '康县', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3004, now(), now(), NULL, '甘肃省陇南市西和县', '西和县', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3005, now(), now(), NULL, '甘肃省陇南市礼县', '礼县', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3006, now(), now(), NULL, '甘肃省陇南市徽县', '徽县', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3007, now(), now(), NULL, '甘肃省陇南市两当县', '两当县', ',2925,2998,', 2998);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3008, now(), now(), NULL, '甘肃省临夏回族自治州', '临夏回族自治州', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3009, now(), now(), NULL, '甘肃省临夏回族自治州临夏市', '临夏市', ',2925,3008,', 3008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3010, now(), now(), NULL, '甘肃省临夏回族自治州临夏县', '临夏县', ',2925,3008,', 3008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3011, now(), now(), NULL, '甘肃省临夏回族自治州康乐县', '康乐县', ',2925,3008,', 3008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3012, now(), now(), NULL, '甘肃省临夏回族自治州永靖县', '永靖县', ',2925,3008,', 3008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3013, now(), now(), NULL, '甘肃省临夏回族自治州广河县', '广河县', ',2925,3008,', 3008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3014, now(), now(), NULL, '甘肃省临夏回族自治州和政县', '和政县', ',2925,3008,', 3008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3015, now(), now(), NULL, '甘肃省临夏回族自治州东乡族自治县', '东乡族自治县', ',2925,3008,', 3008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3016, now(), now(), NULL, '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县', '积石山保安族东乡族撒拉族自治县', ',2925,3008,', 3008);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3017, now(), now(), NULL, '甘肃省甘南藏族自治州', '甘南藏族自治州', ',2925,', 2925);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3018, now(), now(), NULL, '甘肃省甘南藏族自治州合作市', '合作市', ',2925,3017,', 3017);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3019, now(), now(), NULL, '甘肃省甘南藏族自治州临潭县', '临潭县', ',2925,3017,', 3017);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3020, now(), now(), NULL, '甘肃省甘南藏族自治州卓尼县', '卓尼县', ',2925,3017,', 3017);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3021, now(), now(), NULL, '甘肃省甘南藏族自治州舟曲县', '舟曲县', ',2925,3017,', 3017);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3022, now(), now(), NULL, '甘肃省甘南藏族自治州迭部县', '迭部县', ',2925,3017,', 3017);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3023, now(), now(), NULL, '甘肃省甘南藏族自治州玛曲县', '玛曲县', ',2925,3017,', 3017);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3024, now(), now(), NULL, '甘肃省甘南藏族自治州碌曲县', '碌曲县', ',2925,3017,', 3017);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3025, now(), now(), NULL, '甘肃省甘南藏族自治州夏河县', '夏河县', ',2925,3017,', 3017);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3026, now(), now(), NULL, '青海省', '青海省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3027, now(), now(), NULL, '青海省西宁市', '西宁市', ',3026,', 3026);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3028, now(), now(), NULL, '青海省西宁市城东区', '城东区', ',3026,3027,', 3027);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3029, now(), now(), NULL, '青海省西宁市城中区', '城中区', ',3026,3027,', 3027);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3030, now(), now(), NULL, '青海省西宁市城西区', '城西区', ',3026,3027,', 3027);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3031, now(), now(), NULL, '青海省西宁市城北区', '城北区', ',3026,3027,', 3027);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3032, now(), now(), NULL, '青海省西宁市大通回族土族自治县', '大通回族土族自治县', ',3026,3027,', 3027);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3033, now(), now(), NULL, '青海省西宁市湟中县', '湟中县', ',3026,3027,', 3027);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3034, now(), now(), NULL, '青海省西宁市湟源县', '湟源县', ',3026,3027,', 3027);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3035, now(), now(), NULL, '青海省海东地区', '海东地区', ',3026,', 3026);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3036, now(), now(), NULL, '青海省海东地区平安县', '平安县', ',3026,3035,', 3035);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3037, now(), now(), NULL, '青海省海东地区民和回族土族自治县', '民和回族土族自治县', ',3026,3035,', 3035);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3038, now(), now(), NULL, '青海省海东地区乐都县', '乐都县', ',3026,3035,', 3035);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3039, now(), now(), NULL, '青海省海东地区互助土族自治县', '互助土族自治县', ',3026,3035,', 3035);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3040, now(), now(), NULL, '青海省海东地区化隆回族自治县', '化隆回族自治县', ',3026,3035,', 3035);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3041, now(), now(), NULL, '青海省海东地区循化撒拉族自治县', '循化撒拉族自治县', ',3026,3035,', 3035);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3042, now(), now(), NULL, '青海省海北藏族自治州', '海北藏族自治州', ',3026,', 3026);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3043, now(), now(), NULL, '青海省海北藏族自治州门源回族自治县', '门源回族自治县', ',3026,3042,', 3042);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3044, now(), now(), NULL, '青海省海北藏族自治州祁连县', '祁连县', ',3026,3042,', 3042);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3045, now(), now(), NULL, '青海省海北藏族自治州海晏县', '海晏县', ',3026,3042,', 3042);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3046, now(), now(), NULL, '青海省海北藏族自治州刚察县', '刚察县', ',3026,3042,', 3042);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3047, now(), now(), NULL, '青海省黄南藏族自治州', '黄南藏族自治州', ',3026,', 3026);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3048, now(), now(), NULL, '青海省黄南藏族自治州同仁县', '同仁县', ',3026,3047,', 3047);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3049, now(), now(), NULL, '青海省黄南藏族自治州尖扎县', '尖扎县', ',3026,3047,', 3047);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3050, now(), now(), NULL, '青海省黄南藏族自治州泽库县', '泽库县', ',3026,3047,', 3047);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3051, now(), now(), NULL, '青海省黄南藏族自治州河南蒙古族自治县', '河南蒙古族自治县', ',3026,3047,', 3047);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3052, now(), now(), NULL, '青海省海南藏族自治州', '海南藏族自治州', ',3026,', 3026);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3053, now(), now(), NULL, '青海省海南藏族自治州共和县', '共和县', ',3026,3052,', 3052);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3054, now(), now(), NULL, '青海省海南藏族自治州同德县', '同德县', ',3026,3052,', 3052);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3055, now(), now(), NULL, '青海省海南藏族自治州贵德县', '贵德县', ',3026,3052,', 3052);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3056, now(), now(), NULL, '青海省海南藏族自治州兴海县', '兴海县', ',3026,3052,', 3052);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3057, now(), now(), NULL, '青海省海南藏族自治州贵南县', '贵南县', ',3026,3052,', 3052);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3058, now(), now(), NULL, '青海省果洛藏族自治州', '果洛藏族自治州', ',3026,', 3026);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3059, now(), now(), NULL, '青海省果洛藏族自治州玛沁县', '玛沁县', ',3026,3058,', 3058);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3060, now(), now(), NULL, '青海省果洛藏族自治州班玛县', '班玛县', ',3026,3058,', 3058);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3061, now(), now(), NULL, '青海省果洛藏族自治州甘德县', '甘德县', ',3026,3058,', 3058);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3062, now(), now(), NULL, '青海省果洛藏族自治州达日县', '达日县', ',3026,3058,', 3058);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3063, now(), now(), NULL, '青海省果洛藏族自治州久治县', '久治县', ',3026,3058,', 3058);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3064, now(), now(), NULL, '青海省果洛藏族自治州玛多县', '玛多县', ',3026,3058,', 3058);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3065, now(), now(), NULL, '青海省玉树藏族自治州', '玉树藏族自治州', ',3026,', 3026);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3066, now(), now(), NULL, '青海省玉树藏族自治州玉树县', '玉树县', ',3026,3065,', 3065);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3067, now(), now(), NULL, '青海省玉树藏族自治州杂多县', '杂多县', ',3026,3065,', 3065);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3068, now(), now(), NULL, '青海省玉树藏族自治州称多县', '称多县', ',3026,3065,', 3065);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3069, now(), now(), NULL, '青海省玉树藏族自治州治多县', '治多县', ',3026,3065,', 3065);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3070, now(), now(), NULL, '青海省玉树藏族自治州囊谦县', '囊谦县', ',3026,3065,', 3065);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3071, now(), now(), NULL, '青海省玉树藏族自治州曲麻莱县', '曲麻莱县', ',3026,3065,', 3065);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3072, now(), now(), NULL, '青海省海西蒙古族藏族自治州', '海西蒙古族藏族自治州', ',3026,', 3026);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3073, now(), now(), NULL, '青海省海西蒙古族藏族自治州格尔木市', '格尔木市', ',3026,3072,', 3072);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3074, now(), now(), NULL, '青海省海西蒙古族藏族自治州德令哈市', '德令哈市', ',3026,3072,', 3072);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3075, now(), now(), NULL, '青海省海西蒙古族藏族自治州乌兰县', '乌兰县', ',3026,3072,', 3072);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3076, now(), now(), NULL, '青海省海西蒙古族藏族自治州都兰县', '都兰县', ',3026,3072,', 3072);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3077, now(), now(), NULL, '青海省海西蒙古族藏族自治州天峻县', '天峻县', ',3026,3072,', 3072);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3078, now(), now(), NULL, '宁夏回族自治区', '宁夏回族自治区', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3079, now(), now(), NULL, '宁夏回族自治区银川市', '银川市', ',3078,', 3078);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3080, now(), now(), NULL, '宁夏回族自治区银川市兴庆区', '兴庆区', ',3078,3079,', 3079);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3081, now(), now(), NULL, '宁夏回族自治区银川市西夏区', '西夏区', ',3078,3079,', 3079);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3082, now(), now(), NULL, '宁夏回族自治区银川市金凤区', '金凤区', ',3078,3079,', 3079);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3083, now(), now(), NULL, '宁夏回族自治区银川市永宁县', '永宁县', ',3078,3079,', 3079);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3084, now(), now(), NULL, '宁夏回族自治区银川市贺兰县', '贺兰县', ',3078,3079,', 3079);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3085, now(), now(), NULL, '宁夏回族自治区银川市灵武市', '灵武市', ',3078,3079,', 3079);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3086, now(), now(), NULL, '宁夏回族自治区石嘴山市', '石嘴山市', ',3078,', 3078);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3087, now(), now(), NULL, '宁夏回族自治区石嘴山市大武口区', '大武口区', ',3078,3086,', 3086);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3088, now(), now(), NULL, '宁夏回族自治区石嘴山市惠农区', '惠农区', ',3078,3086,', 3086);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3089, now(), now(), NULL, '宁夏回族自治区石嘴山市平罗县', '平罗县', ',3078,3086,', 3086);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3090, now(), now(), NULL, '宁夏回族自治区吴忠市', '吴忠市', ',3078,', 3078);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3091, now(), now(), NULL, '宁夏回族自治区吴忠市利通区', '利通区', ',3078,3090,', 3090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3092, now(), now(), NULL, '宁夏回族自治区吴忠市红寺堡区', '红寺堡区', ',3078,3090,', 3090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3093, now(), now(), NULL, '宁夏回族自治区吴忠市盐池县', '盐池县', ',3078,3090,', 3090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3094, now(), now(), NULL, '宁夏回族自治区吴忠市同心县', '同心县', ',3078,3090,', 3090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3095, now(), now(), NULL, '宁夏回族自治区吴忠市青铜峡市', '青铜峡市', ',3078,3090,', 3090);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3096, now(), now(), NULL, '宁夏回族自治区固原市', '固原市', ',3078,', 3078);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3097, now(), now(), NULL, '宁夏回族自治区固原市原州区', '原州区', ',3078,3096,', 3096);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3098, now(), now(), NULL, '宁夏回族自治区固原市西吉县', '西吉县', ',3078,3096,', 3096);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3099, now(), now(), NULL, '宁夏回族自治区固原市隆德县', '隆德县', ',3078,3096,', 3096);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3100, now(), now(), NULL, '宁夏回族自治区固原市泾源县', '泾源县', ',3078,3096,', 3096);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3101, now(), now(), NULL, '宁夏回族自治区固原市彭阳县', '彭阳县', ',3078,3096,', 3096);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3102, now(), now(), NULL, '宁夏回族自治区中卫市', '中卫市', ',3078,', 3078);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3103, now(), now(), NULL, '宁夏回族自治区中卫市沙坡头区', '沙坡头区', ',3078,3102,', 3102);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3104, now(), now(), NULL, '宁夏回族自治区中卫市中宁县', '中宁县', ',3078,3102,', 3102);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3105, now(), now(), NULL, '宁夏回族自治区中卫市海原县', '海原县', ',3078,3102,', 3102);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3106, now(), now(), NULL, '新疆维吾尔自治区', '新疆维吾尔自治区', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3107, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市', '乌鲁木齐市', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3108, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市天山区', '天山区', ',3106,3107,', 3107);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3109, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市沙依巴克区', '沙依巴克区', ',3106,3107,', 3107);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3110, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市新市区', '新市区', ',3106,3107,', 3107);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3111, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市水磨沟区', '水磨沟区', ',3106,3107,', 3107);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3112, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市头屯河区', '头屯河区', ',3106,3107,', 3107);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3113, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市达坂城区', '达坂城区', ',3106,3107,', 3107);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3114, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市米东区', '米东区', ',3106,3107,', 3107);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3115, now(), now(), NULL, '新疆维吾尔自治区乌鲁木齐市乌鲁木齐县', '乌鲁木齐县', ',3106,3107,', 3107);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3116, now(), now(), NULL, '新疆维吾尔自治区克拉玛依市', '克拉玛依市', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3117, now(), now(), NULL, '新疆维吾尔自治区克拉玛依市独山子区', '独山子区', ',3106,3116,', 3116);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3118, now(), now(), NULL, '新疆维吾尔自治区克拉玛依市克拉玛依区', '克拉玛依区', ',3106,3116,', 3116);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3119, now(), now(), NULL, '新疆维吾尔自治区克拉玛依市白碱滩区', '白碱滩区', ',3106,3116,', 3116);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3120, now(), now(), NULL, '新疆维吾尔自治区克拉玛依市乌尔禾区', '乌尔禾区', ',3106,3116,', 3116);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3121, now(), now(), NULL, '新疆维吾尔自治区吐鲁番地区', '吐鲁番地区', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3122, now(), now(), NULL, '新疆维吾尔自治区吐鲁番地区吐鲁番市', '吐鲁番市', ',3106,3121,', 3121);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3123, now(), now(), NULL, '新疆维吾尔自治区吐鲁番地区鄯善县', '鄯善县', ',3106,3121,', 3121);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3124, now(), now(), NULL, '新疆维吾尔自治区吐鲁番地区托克逊县', '托克逊县', ',3106,3121,', 3121);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3125, now(), now(), NULL, '新疆维吾尔自治区哈密地区', '哈密地区', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3126, now(), now(), NULL, '新疆维吾尔自治区哈密地区哈密市', '哈密市', ',3106,3125,', 3125);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3127, now(), now(), NULL, '新疆维吾尔自治区哈密地区巴里坤哈萨克自治县', '巴里坤哈萨克自治县', ',3106,3125,', 3125);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3128, now(), now(), NULL, '新疆维吾尔自治区哈密地区伊吾县', '伊吾县', ',3106,3125,', 3125);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3129, now(), now(), NULL, '新疆维吾尔自治区昌吉回族自治州', '昌吉回族自治州', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3130, now(), now(), NULL, '新疆维吾尔自治区昌吉回族自治州昌吉市', '昌吉市', ',3106,3129,', 3129);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3131, now(), now(), NULL, '新疆维吾尔自治区昌吉回族自治州阜康市', '阜康市', ',3106,3129,', 3129);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3132, now(), now(), NULL, '新疆维吾尔自治区昌吉回族自治州呼图壁县', '呼图壁县', ',3106,3129,', 3129);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3133, now(), now(), NULL, '新疆维吾尔自治区昌吉回族自治州玛纳斯县', '玛纳斯县', ',3106,3129,', 3129);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3134, now(), now(), NULL, '新疆维吾尔自治区昌吉回族自治州奇台县', '奇台县', ',3106,3129,', 3129);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3135, now(), now(), NULL, '新疆维吾尔自治区昌吉回族自治州吉木萨尔县', '吉木萨尔县', ',3106,3129,', 3129);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3136, now(), now(), NULL, '新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县', '木垒哈萨克自治县', ',3106,3129,', 3129);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3137, now(), now(), NULL, '新疆维吾尔自治区博尔塔拉蒙古自治州', '博尔塔拉蒙古自治州', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3138, now(), now(), NULL, '新疆维吾尔自治区博尔塔拉蒙古自治州博乐市', '博乐市', ',3106,3137,', 3137);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3139, now(), now(), NULL, '新疆维吾尔自治区博尔塔拉蒙古自治州精河县', '精河县', ',3106,3137,', 3137);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3140, now(), now(), NULL, '新疆维吾尔自治区博尔塔拉蒙古自治州温泉县', '温泉县', ',3106,3137,', 3137);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3141, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州', '巴音郭楞蒙古自治州', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3142, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市', '库尔勒市', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3143, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州轮台县', '轮台县', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3144, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县', '尉犁县', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3145, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州若羌县', '若羌县', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3146, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州且末县', '且末县', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3147, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县', '焉耆回族自治县', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3148, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州和静县', '和静县', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3149, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州和硕县', '和硕县', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3150, now(), now(), NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州博湖县', '博湖县', ',3106,3141,', 3141);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3151, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区', '阿克苏地区', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3152, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区阿克苏市', '阿克苏市', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3153, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区温宿县', '温宿县', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3154, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区库车县', '库车县', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3155, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区沙雅县', '沙雅县', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3156, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区新和县', '新和县', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3157, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区拜城县', '拜城县', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3158, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区乌什县', '乌什县', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3159, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区阿瓦提县', '阿瓦提县', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3160, now(), now(), NULL, '新疆维吾尔自治区阿克苏地区柯坪县', '柯坪县', ',3106,3151,', 3151);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3161, now(), now(), NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州', '克孜勒苏柯尔克孜自治州', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3162, now(), now(), NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市', '阿图什市', ',3106,3161,', 3161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3163, now(), now(), NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县', '阿克陶县', ',3106,3161,', 3161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3164, now(), now(), NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县', '阿合奇县', ',3106,3161,', 3161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3165, now(), now(), NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县', '乌恰县', ',3106,3161,', 3161);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3166, now(), now(), NULL, '新疆维吾尔自治区喀什地区', '喀什地区', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3167, now(), now(), NULL, '新疆维吾尔自治区喀什地区喀什市', '喀什市', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3168, now(), now(), NULL, '新疆维吾尔自治区喀什地区疏附县', '疏附县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3169, now(), now(), NULL, '新疆维吾尔自治区喀什地区疏勒县', '疏勒县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3170, now(), now(), NULL, '新疆维吾尔自治区喀什地区英吉沙县', '英吉沙县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3171, now(), now(), NULL, '新疆维吾尔自治区喀什地区泽普县', '泽普县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3172, now(), now(), NULL, '新疆维吾尔自治区喀什地区莎车县', '莎车县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3173, now(), now(), NULL, '新疆维吾尔自治区喀什地区叶城县', '叶城县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3174, now(), now(), NULL, '新疆维吾尔自治区喀什地区麦盖提县', '麦盖提县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3175, now(), now(), NULL, '新疆维吾尔自治区喀什地区岳普湖县', '岳普湖县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3176, now(), now(), NULL, '新疆维吾尔自治区喀什地区伽师县', '伽师县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3177, now(), now(), NULL, '新疆维吾尔自治区喀什地区巴楚县', '巴楚县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3178, now(), now(), NULL, '新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县', '塔什库尔干塔吉克自治县', ',3106,3166,', 3166);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3179, now(), now(), NULL, '新疆维吾尔自治区和田地区', '和田地区', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3180, now(), now(), NULL, '新疆维吾尔自治区和田地区和田市', '和田市', ',3106,3179,', 3179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3181, now(), now(), NULL, '新疆维吾尔自治区和田地区和田县', '和田县', ',3106,3179,', 3179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3182, now(), now(), NULL, '新疆维吾尔自治区和田地区墨玉县', '墨玉县', ',3106,3179,', 3179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3183, now(), now(), NULL, '新疆维吾尔自治区和田地区皮山县', '皮山县', ',3106,3179,', 3179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3184, now(), now(), NULL, '新疆维吾尔自治区和田地区洛浦县', '洛浦县', ',3106,3179,', 3179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3185, now(), now(), NULL, '新疆维吾尔自治区和田地区策勒县', '策勒县', ',3106,3179,', 3179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3186, now(), now(), NULL, '新疆维吾尔自治区和田地区于田县', '于田县', ',3106,3179,', 3179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3187, now(), now(), NULL, '新疆维吾尔自治区和田地区民丰县', '民丰县', ',3106,3179,', 3179);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3188, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州', '伊犁哈萨克自治州', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3189, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州伊宁市', '伊宁市', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3190, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州奎屯市', '奎屯市', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3191, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州伊宁县', '伊宁县', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3192, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县', '察布查尔锡伯自治县', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3193, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州霍城县', '霍城县', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3194, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州巩留县', '巩留县', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3195, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州新源县', '新源县', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3196, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州昭苏县', '昭苏县', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3197, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州特克斯县', '特克斯县', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3198, now(), now(), NULL, '新疆维吾尔自治区伊犁哈萨克自治州尼勒克县', '尼勒克县', ',3106,3188,', 3188);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3199, now(), now(), NULL, '新疆维吾尔自治区塔城地区', '塔城地区', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3200, now(), now(), NULL, '新疆维吾尔自治区塔城地区塔城市', '塔城市', ',3106,3199,', 3199);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3201, now(), now(), NULL, '新疆维吾尔自治区塔城地区乌苏市', '乌苏市', ',3106,3199,', 3199);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3202, now(), now(), NULL, '新疆维吾尔自治区塔城地区额敏县', '额敏县', ',3106,3199,', 3199);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3203, now(), now(), NULL, '新疆维吾尔自治区塔城地区沙湾县', '沙湾县', ',3106,3199,', 3199);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3204, now(), now(), NULL, '新疆维吾尔自治区塔城地区托里县', '托里县', ',3106,3199,', 3199);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3205, now(), now(), NULL, '新疆维吾尔自治区塔城地区裕民县', '裕民县', ',3106,3199,', 3199);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3206, now(), now(), NULL, '新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县', '和布克赛尔蒙古自治县', ',3106,3199,', 3199);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3207, now(), now(), NULL, '新疆维吾尔自治区阿勒泰地区', '阿勒泰地区', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3208, now(), now(), NULL, '新疆维吾尔自治区阿勒泰地区阿勒泰市', '阿勒泰市', ',3106,3207,', 3207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3209, now(), now(), NULL, '新疆维吾尔自治区阿勒泰地区布尔津县', '布尔津县', ',3106,3207,', 3207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3210, now(), now(), NULL, '新疆维吾尔自治区阿勒泰地区富蕴县', '富蕴县', ',3106,3207,', 3207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3211, now(), now(), NULL, '新疆维吾尔自治区阿勒泰地区福海县', '福海县', ',3106,3207,', 3207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3212, now(), now(), NULL, '新疆维吾尔自治区阿勒泰地区哈巴河县', '哈巴河县', ',3106,3207,', 3207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3213, now(), now(), NULL, '新疆维吾尔自治区阿勒泰地区青河县', '青河县', ',3106,3207,', 3207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3214, now(), now(), NULL, '新疆维吾尔自治区阿勒泰地区吉木乃县', '吉木乃县', ',3106,3207,', 3207);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3215, now(), now(), NULL, '新疆维吾尔自治区石河子市', '石河子市', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3216, now(), now(), NULL, '新疆维吾尔自治区阿拉尔市', '阿拉尔市', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3217, now(), now(), NULL, '新疆维吾尔自治区图木舒克市', '图木舒克市', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3218, now(), now(), NULL, '新疆维吾尔自治区五家渠市', '五家渠市', ',3106,', 3106);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3219, now(), now(), NULL, '台湾省', '台湾省', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3220, now(), now(), NULL, '台湾省台北市', '台北市', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3221, now(), now(), NULL, '台湾省高雄市', '高雄市', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3222, now(), now(), NULL, '台湾省台南市', '台南市', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3223, now(), now(), NULL, '台湾省台中市', '台中市', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3224, now(), now(), NULL, '台湾省金门县', '金门县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3225, now(), now(), NULL, '台湾省南投县', '南投县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3226, now(), now(), NULL, '台湾省基隆市', '基隆市', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3227, now(), now(), NULL, '台湾省新竹市', '新竹市', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3228, now(), now(), NULL, '台湾省嘉义市', '嘉义市', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3229, now(), now(), NULL, '台湾省新北市', '新北市', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3230, now(), now(), NULL, '台湾省宜兰县', '宜兰县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3231, now(), now(), NULL, '台湾省新竹县', '新竹县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3232, now(), now(), NULL, '台湾省桃园县', '桃园县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3233, now(), now(), NULL, '台湾省苗栗县', '苗栗县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3234, now(), now(), NULL, '台湾省彰化县', '彰化县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3235, now(), now(), NULL, '台湾省嘉义县', '嘉义县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3236, now(), now(), NULL, '台湾省云林县', '云林县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3237, now(), now(), NULL, '台湾省屏东县', '屏东县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3238, now(), now(), NULL, '台湾省台东县', '台东县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3239, now(), now(), NULL, '台湾省花莲县', '花莲县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3240, now(), now(), NULL, '台湾省澎湖县', '澎湖县', ',3219,', 3219);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3241, now(), now(), NULL, '台湾省台北市中正区', '中正区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3242, now(), now(), NULL, '台湾省台北市大同区', '大同区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3243, now(), now(), NULL, '台湾省台北市中山区', '中山区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3244, now(), now(), NULL, '台湾省台北市松山区', '松山区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3245, now(), now(), NULL, '台湾省台北市大安区', '大安区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3246, now(), now(), NULL, '台湾省台北市万华区', '万华区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3247, now(), now(), NULL, '台湾省台北市信义区', '信义区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3248, now(), now(), NULL, '台湾省台北市士林区', '士林区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3249, now(), now(), NULL, '台湾省台北市北投区', '北投区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3250, now(), now(), NULL, '台湾省台北市内湖区', '内湖区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3251, now(), now(), NULL, '台湾省台北市南港区', '南港区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3252, now(), now(), NULL, '台湾省台北市文山区', '文山区', ',3219,3220,', 3220);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3253, now(), now(), NULL, '台湾省嘉义县东区', '东区', ',3219,3235,', 3235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3254, now(), now(), NULL, '台湾省嘉义县西区', '西区', ',3219,3235,', 3235);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3255, now(), now(), NULL, '台湾省高雄市新兴区', '新兴区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3256, now(), now(), NULL, '台湾省高雄市前金区', '前金区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3257, now(), now(), NULL, '台湾省高雄市芩雅区', '芩雅区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3258, now(), now(), NULL, '台湾省高雄市盐埕区', '盐埕区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3259, now(), now(), NULL, '台湾省高雄市鼓山区', '鼓山区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3260, now(), now(), NULL, '台湾省高雄市旗津区', '旗津区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3261, now(), now(), NULL, '台湾省高雄市前镇区', '前镇区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3262, now(), now(), NULL, '台湾省高雄市三民区', '三民区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3263, now(), now(), NULL, '台湾省高雄市左营区', '左营区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3264, now(), now(), NULL, '台湾省高雄市楠梓区', '楠梓区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3265, now(), now(), NULL, '台湾省高雄市小港区', '小港区', ',3219,3221,', 3221);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3266, now(), now(), NULL, '台湾省基隆市仁爱区', '仁爱区', ',3219,3226,', 3226);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3267, now(), now(), NULL, '台湾省基隆市信义区', '信义区', ',3219,3226,', 3226);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3268, now(), now(), NULL, '台湾省基隆市中正区', '中正区', ',3219,3226,', 3226);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3269, now(), now(), NULL, '台湾省基隆市中山区', '中山区', ',3219,3226,', 3226);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3270, now(), now(), NULL, '台湾省基隆市安乐区', '安乐区', ',3219,3226,', 3226);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3271, now(), now(), NULL, '台湾省基隆市暖暖区', '暖暖区', ',3219,3226,', 3226);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3272, now(), now(), NULL, '台湾省基隆市七堵区', '七堵区', ',3219,3226,', 3226);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3273, now(), now(), NULL, '台湾省台南市中西区', '中西区', ',3219,3222,', 3222);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3274, now(), now(), NULL, '台湾省台南市东区', '东区', ',3219,3222,', 3222);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3275, now(), now(), NULL, '台湾省台南市南区', '南区', ',3219,3222,', 3222);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3276, now(), now(), NULL, '台湾省台南市北区', '北区', ',3219,3222,', 3222);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3277, now(), now(), NULL, '台湾省台南市安平区', '安平区', ',3219,3222,', 3222);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3278, now(), now(), NULL, '台湾省台南市安南区', '安南区', ',3219,3222,', 3222);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3279, now(), now(), NULL, '台湾省新竹市东区', '东区', ',3219,3227,', 3227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3280, now(), now(), NULL, '台湾省新竹市北区', '北区', ',3219,3227,', 3227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3281, now(), now(), NULL, '台湾省新竹市香山区', '香山区', ',3219,3227,', 3227);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3282, now(), now(), NULL, '台湾省台中市中区', '中区', ',3219,3223,', 3223);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3283, now(), now(), NULL, '台湾省台中市东区', '东区', ',3219,3223,', 3223);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3284, now(), now(), NULL, '台湾省台中市南区', '南区', ',3219,3223,', 3223);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3285, now(), now(), NULL, '台湾省台中市西区', '西区', ',3219,3223,', 3223);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3286, now(), now(), NULL, '台湾省台中市北区', '北区', ',3219,3223,', 3223);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3287, now(), now(), NULL, '台湾省台中市北屯区', '北屯区', ',3219,3223,', 3223);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3288, now(), now(), NULL, '台湾省台中市西屯区', '西屯区', ',3219,3223,', 3223);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3289, now(), now(), NULL, '台湾省台中市南屯区', '南屯区', ',3219,3223,', 3223);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3290, now(), now(), NULL, '台湾省嘉义市东区', '东区', ',3219,3228,', 3228);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3291, now(), now(), NULL, '台湾省嘉义市西区', '西区', ',3219,3228,', 3228);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3292, now(), now(), NULL, '香港特别行政区', '香港特别行政区', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3293, now(), now(), NULL, '香港特别行政区香港岛', '香港岛', ',3292,', 3292);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3294, now(), now(), NULL, '香港特别行政区九龙', '九龙', ',3292,', 3292);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3295, now(), now(), NULL, '香港特别行政区新界', '新界', ',3292,', 3292);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3296, now(), now(), NULL, '香港特别行政区九龙九龙城区', '九龙城区', ',3292,3294,', 3294);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3297, now(), now(), NULL, '香港特别行政区九龙油尖旺区', '油尖旺区', ',3292,3294,', 3294);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3298, now(), now(), NULL, '香港特别行政区九龙深水埗区', '深水埗区', ',3292,3294,', 3294);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3299, now(), now(), NULL, '香港特别行政区九龙黄大仙区', '黄大仙区', ',3292,3294,', 3294);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3300, now(), now(), NULL, '香港特别行政区九龙观塘区', '观塘区', ',3292,3294,', 3294);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3301, now(), now(), NULL, '香港特别行政区香港岛中西区', '中西区', ',3292,3293,', 3293);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3302, now(), now(), NULL, '香港特别行政区香港岛湾仔', '湾仔', ',3292,3293,', 3293);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3303, now(), now(), NULL, '香港特别行政区香港岛东区', '东区', ',3292,3293,', 3293);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3304, now(), now(), NULL, '香港特别行政区香港岛南区', '南区', ',3292,3293,', 3293);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3305, now(), now(), NULL, '香港特别行政区新界北区', '北区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3306, now(), now(), NULL, '香港特别行政区新界大埔区', '大埔区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3307, now(), now(), NULL, '香港特别行政区新界沙田区', '沙田区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3308, now(), now(), NULL, '香港特别行政区新界西贡区', '西贡区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3309, now(), now(), NULL, '香港特别行政区新界元朗区', '元朗区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3310, now(), now(), NULL, '香港特别行政区新界屯门区', '屯门区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3311, now(), now(), NULL, '香港特别行政区新界荃湾区', '荃湾区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3312, now(), now(), NULL, '香港特别行政区新界葵青区', '葵青区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3313, now(), now(), NULL, '香港特别行政区新界离岛区', '离岛区', ',3292,3295,', 3295);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3314, now(), now(), NULL, '澳门特别行政区', '澳门特别行政区', ',', NULL);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3315, now(), now(), NULL, '澳门特别行政区澳门半岛', '澳门半岛', ',3314,', 3314);
insert into xx_area (id, create_date, modify_date, orders, full_name, name, tree_path, parent) values(3316, now(), now(), NULL, '澳门特别行政区离岛', '离岛', ',3314,', 3314);
insert into xx_plugin_config (id, create_date, modify_date, orders, is_enabled, plugin_id) values(1, now(), now(), 100, b'1', 'filePlugin');
insert into xx_plugin_config (id, create_date, modify_date, orders, is_enabled, plugin_id) values(2, now(), now(), 1, b'1', 'alipayDirectPlugin');
insert into xx_plugin_config (id, create_date, modify_date, orders, is_enabled, plugin_id) values(3, now(), now(), 2, b'1', 'tenpayDirectPlugin');
insert into xx_plugin_config (id, create_date, modify_date, orders, is_enabled, plugin_id) values(4, now(), now(), 3, b'1', 'pay99billPlugin');
insert into xx_plugin_config (id, create_date, modify_date, orders, is_enabled, plugin_id) values(5, now(), now(), 4, b'1', 'yeepayPlugin');
insert into xx_plugin_config (id, create_date, modify_date, orders, is_enabled, plugin_id) values(6, now(), now(), 5, b'1', 'unionpayPlugin');
insert into xx_plugin_config (id, create_date, modify_date, orders, is_enabled, plugin_id) values(7, now(), now(), 6, b'1', 'paypalPlugin');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(2, '0', 'fee');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(2, 'fixed', 'feeType');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(2, 'abc', 'key');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(2, 'abc', 'partner');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(2, '支付宝即时交易', 'paymentName');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(2, 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/alipay.gif', 'logo');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(3, '0', 'fee');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(3, 'fixed', 'feeType');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(3, 'abc', 'key');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(3, 'abc', 'partner');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(3, '财付通即时交易', 'paymentName');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(3, 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/tenpay.gif', 'logo');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(4, '0', 'fee');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(4, 'fixed', 'feeType');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(4, 'abc', 'key');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(4, 'abc', 'partner');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(4, '快钱支付', 'paymentName');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(4, 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/99bill.gif', 'logo');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(5, '0', 'fee');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(5, 'fixed', 'feeType');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(5, 'abc', 'key');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(5, 'abc', 'partner');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(5, '易宝支付', 'paymentName');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(5, 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/yeepay.gif', 'logo');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(6, '0', 'fee');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(6, 'fixed', 'feeType');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(6, 'abc', 'key');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(6, 'abc', 'partner');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(6, '银联在线支付', 'paymentName');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(6, 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/unionpay.gif', 'logo');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(7, '0', 'fee');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(7, 'fixed', 'feeType');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(7, 'abc', 'key');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(7, 'abc', 'partner');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(7, 'Paypal', 'paymentName');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(7, 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/paypal.gif', 'logo');
insert into xx_plugin_config_attribute (plugin_config, attributes, name) values(7, 'USD', 'currency');
insert into xx_sn (id, create_date, modify_date, last_value, `type`) values(1, now(), now(), 6, 0);
insert into xx_sn (id, create_date, modify_date, last_value, `type`) values(2, now(), now(), 1, 1);
insert into xx_sn (id, create_date, modify_date, last_value, `type`) values(3, now(), now(), 1, 2);
insert into xx_sn (id, create_date, modify_date, last_value, `type`) values(4, now(), now(), 1, 3);
insert into xx_sn (id, create_date, modify_date, last_value, `type`) values(5, now(), now(), 1, 4);
insert into xx_sn (id, create_date, modify_date, last_value, `type`) values(6, now(), now(), 1, 5);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(1, now(), now(), '${setting.siteName}', '${setting.siteName}', '${setting.siteName}', 0);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(2, now(), now(), '${productCategory.name}', '${productCategory.name}', '${productCategory.name}', 1);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(3, now(), now(), '${productKeyword}', '${productKeyword}', '${productKeyword}', 2);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(4, now(), now(), '${product.name}', '${product.name}', '${product.name}', 3);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(5, now(), now(), '${articleCategory.name}', '${articleCategory.name}', '${articleCategory.name}', 4);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(6, now(), now(), '${articleKeyword}', '${articleKeyword}', '${articleKeyword}', 5);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(7, now(), now(), '${article.title}', '${article.title}', '${article.title}', 6);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(8, now(), now(), '${setting.siteName}', '${setting.siteName}', '${setting.siteName}', 7);
insert into xx_seo (id, create_date, modify_date, description, keywords, title, `type`) values(9, now(), now(), '${brand.name}', '${brand.name}', '${brand.name}', 8);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(1, now(), now(), NULL, 50, '头部广告', '<div class="headerAd">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "image"]\r\n			[#if ad.url??]\r\n				<a href="${ad.url}">\r\n					<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n				</a>\r\n			[#else]\r\n				<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 320);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(2, now(), now(), NULL, 52, '底部广告', '<div class="footerAd">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "image"]\r\n			[#if ad.url??]\r\n				<a href="${ad.url}">\r\n					<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n				</a>\r\n			[#else]\r\n				<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 950);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(3, now(), now(), NULL, 290, '首页轮播广告', '<div id="slider" class="slider">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "image"]\r\n			[#if ad.url??]\r\n				<a href="${ad.url}">\r\n					<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n				</a>\r\n			[#else]\r\n				<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 770);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(4, now(), now(), NULL, 106, '首页右侧广告', '<div class="rightAd">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "image"]\r\n			[#if ad.url??]\r\n				<a href="${ad.url}">\r\n					<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n				</a>\r\n			[#else]\r\n				<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 230);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(5, now(), now(), NULL, 120, '首页中部广告', '<div class="middleAd">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "image"]\r\n			[#if ad.url??]\r\n				<a href="${ad.url}">\r\n					<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n				</a>\r\n			[#else]\r\n				<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 1000);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(6, now(), now(), NULL, 343, '首页热门商品左则广告', '[#list adPosition.ads as ad]\r\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "image"]\r\n		[#if ad.url??]\r\n			<a href="${ad.url}">\r\n				<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n			</a>\r\n		[#else]\r\n			<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n		[/#if]\r\n	[/#if]\r\n[/#list]', 260);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(7, now(), now(), NULL, 343, '首页最新商品左则广告', '[#list adPosition.ads as ad]\r\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "image"]\r\n		[#if ad.url??]\r\n			<a href="${ad.url}">\r\n				<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n			</a>\r\n		[#else]\r\n			<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n		[/#if]\r\n	[/#if]\r\n[/#list]', 260);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(8, now(), now(), NULL, 300, '会员注册右侧广告', '<div class="ad">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "text"]\r\n			[#if ad.url??]\r\n				<a href="${ad.url}">\r\n					${ad.content}\r\n				</a>\r\n			[#else]\r\n				${ad.content}\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 240);
insert into xx_ad_position (id, create_date, modify_date, description, height, name, template, width) values(9, now(), now(), NULL, 330, '会员登录左侧广告', '<div class="ad">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == "image"]\r\n			[#if ad.url??]\r\n				<a href="${ad.url}">\r\n					<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n				</a>\r\n			[#else]\r\n				<img src="${ad.path}" width="${adPosition.width}" height="${adPosition.height}" alt="${ad.title}" title="${ad.title}" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 500);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(1, now(), now(), 1, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/header.jpg', '正品保障', 1, NULL, 1);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(2, now(), now(), 2, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/footer.jpg', '我们的优势', 1, NULL, 2);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(3, now(), now(), 3, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/index_1.jpg', '享受这一刻的舒适', 1, NULL, 3);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(4, now(), now(), 4, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/index_2.jpg', '浪漫时尚季', 1, NULL, 3);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(5, now(), now(), 5, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/index_3.jpg', '伊见清新', 1, NULL, 3);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(6, now(), now(), 6, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/index_right.jpg', '春季新品', 1, NULL, 4);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(7, now(), now(), 7, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/index_top.jpg', '特卖会专场', 1, NULL, 5);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(8, now(), now(), 8, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/index_hot_product.jpg', '热门商品', 1, NULL, 6);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(9, now(), now(), 9, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/index_new_product.jpg', '最新商品', 1, NULL, 7);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(10, now(), now(), 10, NULL, '<dl>\r\n	<dt>\r\n		注册即享受\r\n	</dt>\r\n	<dd>\r\n		正品保障、正规发票\r\n	</dd>\r\n	<dd>\r\n		货到付款、会员服务\r\n	</dd>\r\n	<dd>\r\n		自由退换、售后上门\r\n	</dd>\r\n</dl>', NULL, NULL, '会员注册', 0, NULL, 8);
insert into xx_ad (id, create_date, modify_date, orders, begin_date, content, end_date, path, title, `type`, url, ad_position) values(11, now(), now(), 11, NULL, NULL, NULL, 'http://storage.shopxx.net/demo-image/3.0/ad/login.jpg', '会员登录', 1, NULL, 9);




insert into xx_delivery_corp (id, create_date, modify_date, orders, code, name, url) values(1, now(), now(), 1, 'yuantong', '圆通速递', 'http://www.yto.net.cn');
insert into xx_delivery_corp (id, create_date, modify_date, orders, code, name, url) values(2, now(), now(), 2, 'shentong', '申通快递', 'http://www.sto.cn');
insert into xx_delivery_corp (id, create_date, modify_date, orders, code, name, url) values(3, now(), now(), 3, 'yunda', '韵达快运', 'http://www.yundaex.com');
insert into xx_delivery_corp (id, create_date, modify_date, orders, code, name, url) values(4, now(), now(), 4, 'shunfeng', '顺丰速递', 'http://www.sf-express.com');

insert into xx_shipping_method (id, create_date, modify_date, orders, continue_price, continue_weight, description, first_price, first_weight, icon, name, default_delivery_corp) values(1, now(), now(), 1, 0.000000, 1000, '系统将根据您的收货地址自动匹配快递公司进行配送，享受免运费服务', 0.000000, 1000, '${demoImageUrl}/shipping_method/normal.gif', '普通快递', 2);
insert into xx_shipping_method (id, create_date, modify_date, orders, continue_price, continue_weight, description, first_price, first_weight, icon, name, default_delivery_corp) values(2, now(), now(), 2, 0.000000, 1000, '需支付10元配送费用，不享受免运费服务', 10.000000, 1000, '${demoImageUrl}/shipping_method/shunfeng.gif', '顺丰速递', 4);

insert into xx_payment_method (id, create_date, modify_date, orders, content, description, icon, method, name, timeout) values(1, now(), now(), 1, NULL, '支持支付宝、财付通、以及大多数网上银行支付', '${demoImageUrl}/payment_method/online.gif', 0, '网上支付', 1440);
insert into xx_payment_method (id, create_date, modify_date, orders, content, description, icon, method, name, timeout) values(2, now(), now(), 2, '<img src="${demoImageUrl}/201301/8417e751-a1d2-4727-82da-003075a44398.jpg" />', '支持工行、建行、农行汇款支付，收款时间一般为汇款后的1-2个工作日', '${demoImageUrl}/payment_method/remittance.gif', 1, '银行汇款', NULL);
insert into xx_payment_method (id, create_date, modify_date, orders, content, description, icon, method, name, timeout) values(3, now(), now(), 3, NULL, '由快递公司送货上门，您签收后直接将货款交付给快递员', '${demoImageUrl}/payment_method/cash_on_delivery.gif', 1, '货到付款', NULL);

insert into xx_payment_shipping_method (payment_methods, shipping_methods) values(1, 1);
insert into xx_payment_shipping_method (payment_methods, shipping_methods) values(2, 1);
insert into xx_payment_shipping_method (payment_methods, shipping_methods) values(1, 2);
insert into xx_payment_shipping_method (payment_methods, shipping_methods) values(2, 2);
insert into xx_payment_shipping_method (payment_methods, shipping_methods) values(3, 2);

insert into xx_delivery_center (id, create_date, modify_date, address, area_name, contact, is_default, memo, mobile, name, phone, zip_code, area) values(1, now(), now(), '新建安天坛东路888号', '北京市东城区', '李小明', b'0', NULL, '13888888888', '北京发货中心', '010-88888888', '100062', 2);

insert into xx_delivery_template (id, create_date, modify_date, background, content, height, is_default, memo, name, offsetx, offsety, width) values(1, now(), now(), '${demoImageUrl}/delivery_template/yto.png', '<DIV class=item style="Z-INDEX: 10; LEFT: 102px; TOP: 127px"><PRE>${deliveryCenter.name}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style="Z-INDEX: 9; LEFT: 103px; TOP: 98px"><PRE>${deliveryCenter.contact}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style="Z-INDEX: 11; LEFT: 102px; TOP: 164px"><PRE>${deliveryCenter.areaName}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style="Z-INDEX: 3; LEFT: 116px; TOP: 227px"><PRE>${deliveryCenter.mobile}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style="Z-INDEX: 5; LEFT: 278px; TOP: 227px"><PRE>${deliveryCenter.phone}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class="item selected" style="Z-INDEX: 7; LEFT: 459px; TOP: 113px"><PRE>${order.consignee}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style="Z-INDEX: 10; LEFT: 455px; TOP: 171px"><PRE>${order.areaName}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style="Z-INDEX: 15; LEFT: 408px; TOP: 203px"><PRE>${order.address}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style="Z-INDEX: 1; LEFT: 50px; TOP: 198px"><PRE>${deliveryCenter.address}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style="Z-INDEX: 18; LEFT: 501px; TOP: 226px"><PRE>${order.phone}</PRE>\r\n<DIV class=resize></DIV></DIV>', 483, b'1', NULL, '圆通快递', 0, 0, 800);



insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(1, now(), now(), 1, b'0', '会员中心', 0, '/member/index.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(2, now(), now(), 2, b'0', '购物指南', 0, '/article/list/3.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(3, now(), now(), 3, b'0', '关于我们', 0, '/article/list/7.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(4, now(), now(), 4, b'0', '首页', 1, '/');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(5, now(), now(), 5, b'0', '时尚女装', 1, '/product/list/1.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(6, now(), now(), 6, b'0', '精品男装', 1, '/product/list/2.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(7, now(), now(), 7, b'0', '精致内衣', 1, '/product/list/3.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(8, now(), now(), 8, b'0', '服饰配件', 1, '/product/list/4.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(9, now(), now(), 9, b'0', '时尚女鞋', 1, '/product/list/5.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(10, now(), now(), 10, b'0', '流行男鞋', 1, '/product/list/6.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(11, now(), now(), 11, b'0', '童装童鞋', 1, '/product/list/9.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(12, now(), now(), 12, b'0', '关于我们', 2, '#');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(13, now(), now(), 13, b'0', '联系我们', 2, '#');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(14, now(), now(), 14, b'0', '诚聘英才', 2, '#');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(15, now(), now(), 15, b'0', '法律声明', 2, '#');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(16, now(), now(), 16, b'0', '友情链接', 2, '/friend_link.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(17, now(), now(), 17, b'1', '支付方式', 2, '/article/list/4.jhtml');
insert into xx_navigation (id, create_date, modify_date, orders, is_blank_target, name, position, url) values(18, now(), now(), 18, b'1', '配送方式', 2, '/article/list/5.jhtml');



insert into xx_article_category (id, create_date, modify_date, orders, grade, name, seo_description, seo_keywords, seo_title, tree_path, parent) values(1, now(), now(), 1, 0, '商城动态', NULL, NULL, NULL, ',', NULL);
insert into xx_article_category (id, create_date, modify_date, orders, grade, name, seo_description, seo_keywords, seo_title, tree_path, parent) values(2, now(), now(), 2, 0, '活动促销', NULL, NULL, NULL, ',', NULL);
insert into xx_article_category (id, create_date, modify_date, orders, grade, name, seo_description, seo_keywords, seo_title, tree_path, parent) values(3, now(), now(), 3, 0, '购物指南', NULL, NULL, NULL, ',', NULL);
insert into xx_article_category (id, create_date, modify_date, orders, grade, name, seo_description, seo_keywords, seo_title, tree_path, parent) values(4, now(), now(), 4, 0, '支付方式', NULL, NULL, NULL, ',', NULL);
insert into xx_article_category (id, create_date, modify_date, orders, grade, name, seo_description, seo_keywords, seo_title, tree_path, parent) values(5, now(), now(), 5, 0, '配送方式', NULL, NULL, NULL, ',', NULL);
insert into xx_article_category (id, create_date, modify_date, orders, grade, name, seo_description, seo_keywords, seo_title, tree_path, parent) values(6, now(), now(), 6, 0, '售后服务', NULL, NULL, NULL, ',', NULL);
insert into xx_article_category (id, create_date, modify_date, orders, grade, name, seo_description, seo_keywords, seo_title, tree_path, parent) values(7, now(), now(), 7, 0, '关于我们', NULL, NULL, NULL, ',', NULL);

insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(1, now(), now(), NULL, '<p>\r\n	用户购物流程如下：\r\n</p>\r\n<img src="${demoImageUrl}/201301/8e486c07-1365-4fa7-bc62-a40340e0ba59.jpg" />', 16, b'1', b'0', NULL, NULL, NULL, '购物流程', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(2, now(), now(), NULL, '会员等级共分为：注册会员、铜牌会员、银牌会员、金牌会员，会员等级晋升均由系统自动实现，无需申请。', 5, b'1', b'0', NULL, NULL, NULL, '会员等级', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(3, now(), now(), NULL, '进入网站首页，点击页面右上方的“注册”链接，将进入会员注册页面，输入您的用户名、密码等信息后点击“注册”按钮即可完成注册。注册成功后，您可以进入“会员中心 - 个人资料”进行个人信息的修改。', 4, b'1', b'0', NULL, NULL, NULL, '新用户注册', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(4, now(), now(), NULL, '预存款是商城为方便用户支付而设计开发的支付方式，方便、快捷无任何手续费。您可以先将货款充值到预存款帐户中，在订单支付的过程中可以用此方式来进行支付，同样，如果订单发生退换货产生退款时，也可以退到您的预存款帐户中，以便您下次支付时使用。', 4, b'1', b'0', NULL, NULL, NULL, '预存款支付', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(5, now(), now(), NULL, '退换货说明:<br />\r\n&nbsp;<br />\r\n一、 退换货总则：<br />\r\n商城所售商品都是正品行货。商城所有商家将严格按照国家三包政策，针对所售商品履行保修、换货和退货的义务。 <br />\r\n&nbsp;<br />\r\n1.符合以下情况，由您实际收到货物日期起7日内可退货；您实际收到货物日期起8日至第15日内可换货：<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 1）国家三包所规定的功能性故障<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经由生产厂家指定或特约售后服务中心检测确认故障属实，并出据出检报告证实。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 2）到货物品坏损或缺件情况<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经售后人员核查情况属实（期间可能需要快递人员证明或要求您提供实物照片等，以便售后人员快速做出判断及时处理）。<br />\r\n&nbsp;<br />\r\n2.由您实际收到货物日期起15日以上，为了不耽误您使用，缩短故障商品的维修时间，建议您在商品出现故障时直接联系当地厂商维修网点处理。请访问厂商官方网站或拨打厂商服务热线，咨询维修网点信息，凭借发票可到网点维修。国家三包规定保修期内，无品牌厂商售后服务产品，商城提供免费维修服务。<br />\r\n&nbsp;<br />\r\n二、补充说明：<br />\r\n1.以下情况不在退货、换货、维修范围之内：<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）任何非商城出售的商品；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）对于过保商品（超过三包保修期的商品）；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3）未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确的安装所造成的商品质量问题，或撕毁、涂改标贴、机器序号、防伪标记；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4）商品的外包装、附件、赠品（券）、说明书不完整，（券）发票缺失或涂改；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5）商品使用正常磨损；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6）手机、数码、IT类商品通过软件升级可以排除的故障不属于三包范围内的故障，只要送至当地生产厂家指定或特约售后服务中心升级即可；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7）高端品牌箱包及饰品QC标签已损坏的；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 8）出于安全和卫生考虑，贴身用品（内衣等）、食品、化妆品售出后不予退换，经权威部门检测商品存在内在质量问题者除外。<br />\r\n&nbsp;<br />\r\n2.判断实际收货日期规则：<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）快递配送或者自提的订单：以客户实际签收日期为准；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）非配送的订单，按照第三方物流平台显示的实际到货日期为准。如果第三方合作伙伴不能有效返回签收日期，则商城客服根据距离等因素和客户人工确认实际到货日期。<br />\r\n&nbsp;<br />\r\n商城按照国家相关法律法规及规章制度对商品退换原则进行解释。<br />', 5, b'1', b'0', NULL, NULL, NULL, '退换货政策', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(6, now(), now(), NULL, '<p>\r\n	发票注意事项：\r\n</p>\r\n<p>\r\n	1.为了保障消费者的合法权益，在商城购物时，均为您开具由税务局监制印制的正规机打销售发票（海外代购商品除外）; <br />\r\n2.发票是有效交易的重要凭据，可作为单位报销的凭证，也能保证您充分享受到我司提供的售后服务，请妥善保管; <br />\r\n3.我们将随订单为您开具发票，发票内容为您所购买的商品明细，发票金额为您购买商品实际的付款金额;\r\n</p>\r\n<p>\r\n	4.请在订单提交时确认好您所需开具的发票抬头，订单生成后发票抬头将无法再次修改。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	发票开具办法：\r\n</p>\r\n<p>\r\n	1.填写订单信息时请勾选发票，并在下订单时准确填写所需开具的发票抬头名称；\r\n</p>\r\n<p>\r\n	2.发票将随商品一同寄出，收货时请注意查收发票；\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	如有相关发票开具以及换票问题，请与商城客服联系，客服人员将竭诚为您服务；\r\n</p>', 2, b'1', b'0', NULL, NULL, NULL, '发票制度', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(7, now(), now(), NULL, '<p>\r\n	货到付款：\r\n</p>\r\n<p>\r\n	配送人员将货物送达订单指定的收货地址后，由客户支付订单金额给配送人员的一种付款方式。\r\n</p>\r\n<p>\r\n	<br />\r\n在商城购物您可以选择货到付款的支付方式，目前货到付款支持现金支付、移动POS刷卡支付等。\r\n</p>\r\n<p>\r\n	您在使用货到付款支付方式时，请在购物车支付方式处选择货到付款，订单生成后，货到付款的支付形式不能更换成其他支付方式，如果您想换成其他支付方式时，请务必删除原货到付款订单，重新在网站下订单选择其他支付方式。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	温馨提示：\r\n</p>\r\n<p>\r\n	1.当您选择货到付款支付方式生成订单后，商城工作人员会根据您的订购要求，为您发货，货物到达您指定地点后，会有工作人员通过电话方式与您联系，在您确认后，根据您的要求将货物送达，请您做好支付准备，以提高收货效率；<br />\r\n2.签收时，请您仔细核对款项、务必做到货款两清，若事后发现款项错误，我们将无法再核实确认；\r\n</p>', 5, b'1', b'0', NULL, NULL, NULL, '货到付款', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(8, now(), now(), NULL, '承担商城各类产品的售后服务，致力于为广大消费者提供“亲切、快捷、周到”优质阳光服务。多年来我们一直秉承“至真至诚，服务第一；服务是我们的唯一产品，顾客满意是我们服务的终极目标、服务理念。我们提出“服务与责任”理念，把服务责任化，真正地把消费者的利益放在第一位。深层次地挖掘服务精髓，致力专心、专注、专业化服务。', 3, b'1', b'0', NULL, NULL, NULL, '服务理念', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(9, now(), now(), NULL, '<p>\r\n	登陆后，进入“会员中心”可查询到订单状态。&nbsp;<br />\r\n&nbsp;<br />\r\n1、等待付款：请您支付订单款项，若订单尚未获得确认，正常工作时间内，最迟2小时可以获得确认，如非正常工作时间，需要等到上班时间确认。<br />\r\n&nbsp;\r\n</p>\r\n<p>\r\n	3、已支付/等待发货：这时订单已在我们工作人员的处理流程中。<br />\r\n&nbsp;\r\n</p>\r\n<p>\r\n	4、已支付/已发货：您的货物已经发出，请您稍后注意查收，订单详细中可查到快递公司和快递单号。<br />\r\n&nbsp;<br />\r\n5、订单完成：订单已成功完成交易，请对我们的商品进行评论，如收到产品有质量问题，请直接与售后部门联系。\r\n</p>', 2, b'1', b'0', NULL, NULL, NULL, '订单查询', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(10, now(), now(), NULL, '<p>\r\n	配送范围：全国各地。<br />\r\n&nbsp;\r\n</p>\r\n<p>\r\n	配送方式：普通快递、自营快递、EMS。<br />\r\n&nbsp;<br />\r\n1. 商品购买时根据会员所选配送方式为您安排。<br />\r\n&nbsp;<br />\r\n2. 选择快递的配送方式，系统会默认为申通快递。<br />\r\n&nbsp;<br />\r\n收货时间：因所在地区不同而略有差异<br />\r\n&nbsp;<br />\r\n对于一些送货上门，货到付款的；如果您在签收前发现商品有运输损坏问题，可直接拒收并与我们取得联系，商城会重新安排为您配送。外地订单在您签收前，如果发现商品有运输损坏问题，您也可以拒收包裹，写明原因，通过邮局把货返回给我们，我们在收到您退回的包裹后，会征求您的意见决定是否重新安排邮寄。<br />\r\n&nbsp;<br />\r\n配货时限解释：<br />\r\n&nbsp;<br />\r\n1.订单一般在 1-2 天内可以确认完毕，若产品缺货将及时通知您。<br />\r\n&nbsp;<br />\r\n2.配送时限是从订单状态处理到正在送货次日开始计时。不同的配送方式会有不同的配送时限。<br />\r\n&nbsp;<br />\r\n3.如您提供的联系方式或送货地址不正确,将会影响我们配送的速度。为了加快配送速度，请您提供尽可能准确的送货地址信息和联系方式；对于需要送货上门服务的，请不要仅提供信箱号，否则无法为您进行配送。如果您留的送货地址为单位地址，请特别注明您可以收货的时间，如遇到国家法定假日，无特殊说明则送货期限顺延。\r\n</p>', 2, b'1', b'0', NULL, NULL, NULL, '配送方式', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(11, now(), now(), NULL, '<p>\r\n	会员级别分四级，具体为：普通会员、银牌会员、金牌会员、白金会员，会员级别晋升均由系统自动实现，无需申请。\r\n</p>\r\n<p>\r\n	普通会员：<br />\r\n条件：任何愿意到商城购物的用户都可以免费注册。<br />\r\n待遇：可以享受注册会员所能购买的产品及服务。\r\n</p>\r\n<p>\r\n	银牌会员：<br />\r\n条件：商城消费金额达到1000元的会员。<br />\r\n待遇：购买的产品可以享受相应优惠折扣。<br />\r\n&nbsp;<br />\r\n金牌会员：<br />\r\n条件：商城消费金额达到10000元的会员。<br />\r\n待遇：购买的产品可以享受相应优惠折扣。<br />\r\n&nbsp;<br />\r\n白金会员：<br />\r\n条件：商城消费金额达到10000元的会员。<br />\r\n待遇：购买的产品可以享受相应优惠折扣。<br />\r\n&nbsp;<br />\r\n注：针对各个级别会员特别声明：<br />\r\n会员账号禁止转借或转让他人使用，如因转借或转让他人使用所带来的一切后果，商城概不负责。\r\n</p>\r\n<p>\r\n	<br />\r\n&nbsp;\r\n</p>', 2, b'1', b'0', NULL, NULL, NULL, '会员级别', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(12, now(), now(), NULL, '<p>\r\n	客户在接受商品订购与送货的同时，有义务遵守以下交易条款。您在商城下订单之前或接受商城送货之前，请您仔细阅读以下条款：\r\n</p>\r\n<p>\r\n	<br />\r\n1.订购的商品价格以您下订单时价格为准。<br />\r\n&nbsp;<br />\r\n2.请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，商城将不承担责任：<br />\r\na. 客户提供错误信息和不详细的地址; <br />\r\nb. 货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果; <br />\r\nc. 不可抗力，例如：自然灾害、交通戒严、突发战争等。<br />\r\n&nbsp;<br />\r\n安全性：\r\n</p>\r\n<p>\r\n	无论您是通过哪种方式支付、购买，我们会保证交易信息的安全，并由商城授权的员工处理您的订单。<br />\r\n&nbsp;<br />\r\n隐私权：\r\n</p>\r\n<p>\r\n	我们尊重您的隐私权，在任何情况下，我们都不会将您的个人和订单信息出售或泄露给任何第三方（国家司法机关调取除外）。我们从网站上或电话中得到的所有客户信息仅用来处理您的相关订单。<br />\r\n&nbsp;<br />\r\n免责：\r\n</p>\r\n<p>\r\n	如因不可抗力或其它无法控制的原因使商城销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，我们会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失。<br />\r\n&nbsp;<br />\r\n客户监督：\r\n</p>\r\n<p>\r\n	我们希望通过不懈努力，为客户提供最佳服务，商城在给客户提供服务的全过程中接受客户的监督。<br />\r\n&nbsp;<br />\r\n争议处理：\r\n</p>\r\n<p>\r\n	如果客户与我们之间发生任何争议，可依据当时双方所认定的协议及相关法律进行解决。<br />\r\n&nbsp;<br />\r\n我们承诺：<br />\r\n我们秉承质优价低、放心满意的销售理念为您服务。我们所出售的商品均为正品行货，与您亲临商场选购的商品一样享受相同的质量保证；含有质量保证书的商品按照保证书的承诺执行，其它商品按国家有关规定执行。<br />\r\n&nbsp;<br />\r\n特别提示：&nbsp;<br />\r\n我们保证出货时商品外包装的完好无缺。请您在收到货物时当场仔细检查发票及货品与送货单的商品是否一致，如果发现商品缺少或已破损等情况，请在配送人员还在现场时与我司客服部联系；如果发现邮寄包装破损，货物在运输途中破损等情况，请当场指出并拒收，拒收后请致电我司客服。如您已签收或他人代为签收，则视为商品外包装，商品数量及内容无误，我司将无法受理。\r\n</p>', 1, b'1', b'0', NULL, NULL, NULL, '交易条款', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(13, now(), now(), NULL, '&nbsp;长时间未收到订单可能出现的问题<br />\r\n&nbsp;<br />\r\n1.请您确保订单中的收货地址、邮编、电话、Email地址等信息的准确性，以便商品及时、准确地发出；<br />\r\n&nbsp;<br />\r\n2.快递送货上门的订单，配送过程中如果我们联络您的时间超过7天未得到回复，此订单将被默认为您已经放弃订购。如果订单的收货地址是固定某个时间段才可接收商品时, 请您在“订单备注”栏中详细注明；<br />\r\n&nbsp;<br />\r\n3.支付完成但是遇到收货地址不详、支付金额不足或库存不足的订单，将无法及时为您发出；<br />', 1, b'1', b'0', NULL, NULL, NULL, '帮助中心', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(14, now(), now(), NULL, '<p>\r\n	一、如何获得积分：<br />\r\n购买带有积分的商品，或者参加送积分的活动，您即可获得积分;<br />\r\n获得的积分数量：请参照商品详情页展示的积分，最终获得的积分数量以订单结算页显示为准;<br />\r\n积分可在“会员中心”内查询到;<br />\r\n如果您退货，则会在退货成功后扣减您此笔交易的积分;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	二、积分的计算规则：<br />\r\n获得积分的数量：<br />\r\n没有积分活动的商品，会获得实际支付金额的1:1比例的积分；<br />\r\n本商城可能会对促销商品、不同的会员级别在不同时间做积分的活动，比如直接送xxxx积分，或者金级n倍等奖励活动，具体的积分数量，以结算页最终显示为准。不同的活动，享受的积分数量或倍数不同。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	三、积分的使用：<br />\r\n本商城积分有如下使用途径：<br />\r\n登录会员中心—在交易信息里有“积分兑换”;<br />\r\n在积分兑换区里，可以兑换礼券、实物商品、赠品等，内容我们会陆续丰富;\r\n</p>', 4, b'1', b'0', NULL, NULL, NULL, '会员积分', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(15, now(), now(), NULL, '<p>\r\n	优惠券是本商城在线发放给用户用于抵扣产品金额的优惠券。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	如何获取商城优惠券<br />\r\n积分兑换：用积分兑换礼券，如每100积分可兑换1元现金券。具体积分可在“会员中心”——“我的积分”中查询；<br />\r\n现金购买：与在线客户联系，直接用现金购买；<br />\r\n会员专享：本商城会针对会员做惊喜礼券派赠；\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	优惠券使用规则<br />\r\n1.每张优惠券都有一定的使用规则，请在使用前仔细阅读该券的使用说明；<br />\r\n2.每个订单只能使用一张优惠券，一张优惠券只能使用一次；<br />\r\n3.优惠券只能抵扣货款，不找零，不能抵扣配送费、包装费及其他费用；<br />\r\n4. 使用优惠券支付的订单，如发生完成订单后退货，优惠券不予兑现，将按照实际支付货款退还；<br />\r\n5.优惠券细则在法律许可范围内本商城拥有解释权。\r\n</p>', 2, b'1', b'0', NULL, NULL, NULL, '优惠券', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(16, now(), now(), NULL, '<p>\r\n	1 若订单交易未成功，麻烦申请订单金额的正常退款。退款金额返回到您的账户。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	2 若订单交易成功，通过实名认证的用户，退款金额会以即时到帐方式打入您的支付宝/财付通账号，若是非认证用户，请提供其它已认证的支付宝/财付通账号或银行账号进行退款，或直接退款到会员账户中。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	3 若通过其他方式支付的订单，请您提供接收退款的银行信息，包括完整开户行信息（如：xx省xx市分行xx支行）、银行账号、账户名（姓名），为更快的为您办理退款，请优先提供中国建设银行、中国农业银行或中国工商银行的银行账号。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	4 如果所支付的订单中含有非现金部分（如优惠券、积分等），在退款时，非现金部分不能折现。\r\n</p>', 2, b'1', b'0', NULL, NULL, NULL, '退款注意事项', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(17, now(), now(), NULL, '如果您对本商城有任何建议或不满，请与联系我们，我们将在3个工作日内给予回复，非常感谢对我们商城的督促和支持。 <br />', 2, b'1', b'0', NULL, NULL, NULL, '投诉与建议', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(18, now(), now(), NULL, '<p>\r\n	基于国内诈骗案件频发，有不法分子假借一些正规电子商务营运商（下简称电商）的名义推销、强卖假冒产品（如化妆品）或会员卡等，情节恶劣，防不胜防。本商城提醒您网购时留意以下几点，谨防上当。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	1. 收到货到付款订单，先验货，再付款<br />\r\n当快递员将商品送到您的手上时，请先进行验货，确认商品信息，并查看商品名称、数量、价格、商家名称与您订购的信息一致后，再签收付款；<br />\r\n如果您验货时，发现收到的商品包装箱、包装中的商品与自己订购的不相符，请您拒绝签收，或与我们取得联系；\r\n</p>\r\n<p>\r\n	代收说明：如您的商品需要家人或同事代收，请您务必告知以上情况，谨防上当。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	2. 收到关于投奖、中奖、的电话或短信时，请提高警惕<br />\r\n如果您收到陌生人的电话或短信，内容包含抽奖、中奖信息时，请与本商城客服取得联系并确认；\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	3. 收到QQ、论坛站内信提示您进行汇款或中奖信息时，请务必与商城客服确认<br />\r\n商城促销活动、对外公告均可在本商城官网促销页面或网站公告中查看，如果陌生人通过QQ与您联系，提示您进行汇款，或者告诉您中奖的信息，请您联系商城在线客服进行核对，请勿轻信非官方获奖信息！&nbsp;\r\n</p>', 3, b'1', b'0', NULL, NULL, NULL, '防骗提示', 3);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(19, now(), now(), NULL, '商城店庆&nbsp;&nbsp; 时间：（2013.4.27至2013.5.23），<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 跨品类满减优惠：满200减40（优惠码不限量），满400减100（优惠码不限量）。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 通过与商城兑换，在结账时输入优惠码，系统将自动扣除满减金额。如果其他促销也需要输入促销优惠码，则不能与本促销共同使用。<br />', 2, b'1', b'0', '店庆活动', '店庆活动', '店庆活动', '店庆活动 有你更精彩', 2);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(20, now(), now(), NULL, '<p class="MsoNormal">\r\n	<span> </span> \r\n</p>\r\n低价一站到底<br />\r\n<br />\r\n4月27日商城开启低价一站到底，一天三场万人抢购，服饰全场满1999减200，满999减100，品牌服装冲锋底价，更有全场满返现金券，部分品类满100就返30元现金券，更多惊喜，尽在4月27日开启！<br />', 2, b'1', b'0', NULL, NULL, NULL, '低价一站到底', 2);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(21, now(), now(), NULL, '<p>\r\n	各位亲爱的顾客：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 品牌服饰周末耍大牌，为您打造专属于您的男性魅力！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 倾情为您打造男士商务、休闲一站式采购的男装盛典，还为您准备以下惊喜：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜1：众多春夏新品首发，尝鲜体验；&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜2：全场1-5折，所有产品赠精美礼盒包装，支持货到付款或快递发货；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜3：全场满300元减20元，满400元减30元，满900元减100元\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 祝大家购物愉快！\r\n</p>', 3, b'1', b'0', NULL, NULL, NULL, '周末耍大牌', 2);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(22, now(), now(), NULL, '时间：2013-4-27 &nbsp;<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 箱包百万优惠劵免费领啦！20元面额，当现金，无消费限额，即领即用！先领券，再下单直减钱！美旅拉杆箱、大牌ELLE女包、花花公子皮带、威戈电脑包、七匹狼男包。。。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 下单都用券，直减钱！疯了疯了，还不快抢！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 活动时间：4月27号 9:30---5月27号 9:30<br />\r\n<br />', 2, b'1', b'0', NULL, NULL, NULL, '箱包百万优惠券大派送', 2);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(24, now(), now(), NULL, '<p class="MsoNormal">\r\n	<span><span></span></span><span style="font-family:宋体;">尊敬的商城会员：</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span></span><span style="font-family:宋体;">喜迎五．一大促销活动开始啦！</span><span>10</span><span style="font-family:宋体;">元礼品任你选满百即送！多买多得！</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span>&nbsp;&nbsp;&nbsp; <br />\r\n</span></span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span></span></span><span style="font-family:宋体;">活动规则：</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>1.</span><span style="font-family:宋体;">此活动仅限玩具类产品（包括益智图书）。</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>2.</span><span style="font-family:宋体;">单笔订单满</span><span>100</span><span style="font-family:宋体;">元（不包括邮费），本商城儿童玩具</span><span>10</span><span style="font-family:宋体;">以下产品任选</span><span>1</span><span style="font-family:宋体;">件。</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>3.</span><span style="font-family:宋体;">满</span><span>200</span><span style="font-family:宋体;">可任选</span><span>20</span><span style="font-family:宋体;">元以下产品</span><span>1</span><span style="font-family:宋体;">件。满</span><span>300</span><span style="font-family:宋体;">元可任选</span><span>30</span><span style="font-family:宋体;">元以下产品</span><span>1</span><span style="font-family:宋体;">件，以此类推</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>4.</span><span style="font-family:宋体;">活动时间为</span><span>4</span><span style="font-family:宋体;">月</span><span>26</span><span style="font-family:宋体;">日</span><span>~6</span><span style="font-family:宋体;">月</span><span>16</span><span style="font-family:宋体;">日</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>5.</span><span style="font-family:宋体;">最终解释权归本商城所有。</span>\r\n</p>', 0, b'1', b'0', NULL, '欢庆黄金周', '欢庆黄金周', '欢庆黄金周 10元礼品任你选满百即送！多买多得！', 2);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(25, now(), now(), NULL, '<p class="MsoNormal">\r\n	<span style="font-family:宋体;">注册或购买就送</span><span>50</span><span style="font-family:宋体;">积分</span><span><span> <br />\r\n</span></span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;">&nbsp;&nbsp;&nbsp; 活动时间：</span><span>2013</span><span style="font-family:宋体;">年</span><span>4</span><span style="font-family:宋体;">月</span><span>27</span><span style="font-family:宋体;">日至</span><span>2013</span><span style="font-family:宋体;">年</span><span>5</span><span style="font-family:宋体;">月</span><span>27</span><span style="font-family:宋体;">日。</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;">&nbsp;&nbsp;&nbsp; 活动规则：</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;">&nbsp;&nbsp;&nbsp; 活动期间</span><span>,</span><span style="font-family:宋体;">新用户注册和注册用户在商城购物均可获得商城五十积分。（活动期间注册并购买商品的用户只能获得一次五十积分的机会）赠送积分会在活动结束后一周内发放到用户的个人中心</span><span>,</span><span style="font-family:宋体;">请注意查收。如果退货</span><span>,</span><span style="font-family:宋体;">积分会被收回。</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;"><br />\r\n</span>\r\n</p>\r\n<p class="MsoNormal">\r\n	<span style="font-family:宋体;">&nbsp;&nbsp;&nbsp; 商城将不定期举办积分购购购活动</span><span>,</span><span style="font-family:宋体;">会给新老会员发送消息</span><span>,</span><span style="font-family:宋体;">敬请关注。</span>\r\n</p>', 0, b'1', b'0', NULL, '注册送积分', '注册送积分', '注册或购买就送50积分', 2);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(26, now(), now(), NULL, '<p>\r\n	年中大团购 全场3.2折起\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 时间： 2013-01-01\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 商城推出“年中大团购 底价大决算”活动，一年一次的盛惠，抢到就是赚到！<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 活动期间，全场商品最低3.2折起！品牌服饰最高直降200元，箱包买一赠一，惊喜连连，底价大放送，抽奖抽到你手软！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 活动时间：6月26-30日\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 祝大家购物愉快！', 4, b'1', b'0', NULL, NULL, NULL, '年中大团购 全场3.2折起', 2);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(27, now(), now(), NULL, '<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 爱美的你是否早已按捺不住？五一过后就是热辣的夏天，我们为女性朋友们带来涵盖多种品牌的缤纷大促销，从鞋包到服装一应俱全，全面满足你的购物欲。4月27日至4月30日三天内，光临女人节，就有三重特惠供你选择，满199元减60元、满299元减100元、满499元减180元。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 据介绍，此次中国靓丽女人节力邀众多国际知名品牌，为女性朋友带来一道丰盛的美丽大餐。化妆品品牌雅诗兰黛（ESTEE LAUNDER）、兰寇（Lancôme）、资生堂（Shiseido）、玉兰油（OLAY）、欧珀莱（AUPRES）等携手服装品牌欧时力（Ochirly）、埃斯普利特（Esprit）等倾情力减，美颜护肤搭配精致时装，让你惊艳众人；而鞋包品牌比如玖熙（Nine West）、阿迪达斯（Adidas）、蔻驰（Coach）等，也竞相推出促销产品，相信总有一款适合你。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 春天刚过，相信很多女性都在为节后体重增加而烦恼；同时，有很多白领女性年纪轻轻，就已经腰酸背痛。趁此女人节之际，我们特别推出多种运动及户外健身用品，比如阿瑞娜（Arena）、皮尔瑜伽（PierYoga）、狼爪（Jack Wolfskin）等，让女性朋友们走出办公室拥抱自然，远离亚健康，减掉身上赘肉。还等什么？赶快备好行装动起来！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 秉承“天天低价，正品行货”的承诺，我们在这特殊的节日也为女性朋友们带来丰富、优惠的美丽套餐。精彩五月、缤纷夏日，我们和万千女性一起，共同打造真正靓丽时尚的“女人节”。\r\n</p>', 8, b'1', b'0', NULL, NULL, NULL, '五月靓丽女人节 呵护自己', 1);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(28, now(), now(), NULL, '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009年中，苹果公司市值超越谷歌；2010年5月，超越微软成为全球市值最高的科技公司；2012年8月12日，苹果市值超越石油巨头埃克森美孚，登顶全球市值榜首。一次次不断超越为我们展现的不仅是苹果公司活力与激情、动荡与辉煌相互交织的发展轨迹，更是新兴产业与传统产业之间的博弈，以互联网技术为基础的商业时代已经到来。<br />\r\n<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; “移动电子商务”、“社交网络”、“4G”、“SoLoMo”……全新的技术和概念串联起了数字化时代下的鲜明特征，也为未来商业发展提供了更多的可能与选择。时代的快速变化总是超出我们的想象。Google推出的Android操作系统及相应手机在全球迅速流行并普及；以Facebook、Twitter、新浪微博等为代表的社交型平台网络也体现出越来越明显的移动化特征；在日本，De NA、Gree等移动社交网站占据了市值排行榜的前列。显而易见，互联网市场的竞争态势已经从企业间竞争逐渐向全产业链竞争开始转移。近日，搜索巨头Google一手举着刚刚收购的摩托罗拉手机，另一只手则紧握社交终端。马云的态度更是异常坚决：“今年淘宝最重要的任务就是把淘宝SNS化。”百度CEO李彦宏也宣称：“百度要大规模的进入SNS领域。”\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中国的互联网企业在看到社交网络未来发展机遇的同时，也将目光迅速转向到了对移动互联网产业的关注，具有混搭风格的SoLoMo模式则被看成是继PC互联网之后下一个十年的主流发展趋势。在“概念”横行的时代里，电商企业作为互联网生态圈中的又一重要分支，在面对移动互联网这块充满着巨大诱惑和极具挖掘潜力的“蛋糕”时，也纷纷推出了适用于Symbian、Android、iPhone等不同手机平台的移动客户端以完善自身产业链体系。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中国的移动电子商务目前尚处于起步阶段，有业内人士指出：“移动电子商务尤其是手机购物的发展，首先要依赖于智能手机的普及和网络对于应用的支撑，然后是用户习惯的培养，这些是基础。就目前来看，尽管如今智能手机市场发展迅速，但是普及度仍然不够，并且对于移动网络方面，也仍有待发展和完善。同时，与之相关的配套服务也应同比例提升，毕竟电子商务的实质在于‘商务’。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 事实上，目前许多互联网企业应对移动互联网趋势的最稳妥做法就是将其内容和应用从PC向手机进行移植，但要真正要得到用户的青睐，完全取决于用户体验效果的成败。“决定电子商务企业成败的核心点只有四个字‘顾客体验’。电子商务作为新型的业态，尤其在中国还远不够成熟。企业需结合其核心能力与上游供应商端及物流端的资源整合，为顾客提供更好的购物体验和价值。模式的创新多半重‘电子’，竞争关键则在于强化每个‘商务’的细节。”<br />\r\n&nbsp;', 5, b'1', b'0', NULL, NULL, NULL, '电子商务未来是否需要“移动”', 1);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(29, now(), now(), NULL, '尊敬的顾客，您好！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 如果您的多个订单被合并发货， 并且您支付了多次运费的， 请在包裹签收7天后致电客服热线400-000-****， 或发邮件到官方邮箱进行登记，我们将在1个工作日内按实际发货情况将多收运费返还到您的商城个人账号。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 特别说明： 收货后7天内因为可能发生退换货，不处理相关运费返还业务。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 祝您工作顺利、生活愉快！<br />\r\n<br />\r\n2013年4月27日', 3, b'1', b'0', NULL, NULL, NULL, '合并运费返还方案公告', 1);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(30, now(), now(), NULL, '<p>\r\n	&nbsp;&nbsp;&nbsp; 从今日起，国美在线将启动新一轮价格战。记者发现，当当网、1号店、乐蜂网、聚美优品等二线电商也将4月作为了大促时段。在京东商城、苏宁易购等电商试图盈利的发展转型期，二线电商纷纷造势抢占市场份额。\r\n</p>\r\n<p>\r\n	　　据悉，本次国美电商的“最强店庆月”的跨度长达一个月，并将在本月18日店庆当日达到高峰。据一位接近国美在线的人士透露，国美在线方面希望将“4•18”打造成与淘宝“双11”光棍节、京东商城“6•18”店庆促销一样震动行业的电商促销盛宴。\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 不仅是国美在线，当当网、1号店、乐蜂网和聚美优品等电商企业也纷纷在4月掀起促销狂潮。当当网相关负责人表示，利用春夏这一时间点促销，避开淘宝网的秋冬大促，并打造自己的促销品牌。事实上在经历过去年的大促后，京东商城、苏宁易购等电商巨头不约而同开始弱化价格战，将发展重心回归到盈利能力提升以及对用户体验层面上。因为包括京东商城和苏宁易购在内的大型电商都将今年视做变革之年。<br />\r\n<br />\r\n四月电商价格战火重燃 服务为决胜之道<br />\r\n<br />\r\n<p>\r\n	　　进入4月，国美、苏宁电商高举促销让利的大旗，再燃价格战火。而2013一开年，在京东商城内部年会上，京东商城集团创始人兼CEO刘强东发表讲话，阐释京东2013年的“修养生息”战略，并首次指出了京东商城第二个十年的三大发展方向：自营电商、开放服务和数据金融。在2013年围绕美苏之间的首轮价格战来临之时，京东仍旧挂出“免战牌”。由于京东的缺席，原来的“三国杀”变为了“美苏争霸”。\r\n</p>\r\n<p>\r\n	　　有业内人士表示，京东缺席价格战是个好的选择，因为任何一家企业都有自己的问题，京东也不例外。经过六年高速发展的京东，确实需要好好的修养了。人员的扩张带来的问题、生态系统的建设等。刘强东在接受腾讯科技采访时称，京东出现了大公司病的苗头，在业界的声誉没有初创期那么好了。还有人员的扩张，带来了管理的难度。内部的这些问题，远远比价格战重要。把内部的问题梳理、解决好，才能为下一轮的增长打好基础。\r\n</p>\r\n<p>\r\n	　　不过，有分析认为，京东此举并不那么轻松。尽管京东在B2C市场份额占据领先优势，但是在电商混战的状态下，市场格局并没有稳定，未来市场份额排名难以预料。中国电子商务的发展大致可以分为四个阶段：首先是依赖低价格吸引用户的“价格竞争”阶段；其次是通过营销手法诱导用户购买的“营销竞争”阶段；再次是依靠口碑，用货真价实的商品吸引用户多次购买的“品质竞争”阶段；最后，则是更贴近消费者需求、品质更有保证、用户粘性强、品牌美誉度极高，拥有强大品牌吸引力的“品牌竞争”阶段。京东退出价格战，提高自己的服务正是决胜之道。\r\n</p>\r\n<p>\r\n	　　对于爆发的4月“美苏大战”，一定程度上反应了当前行业格局的微妙变化。实际上，去年所发生的京东、国美、苏宁三家电商龙头公司的价格战，将要转变为线上版的“美苏争霸”，无论结果如何，都将对京东现有地位形成一定的威胁。\r\n</p>\r\n<p>\r\n	　　久违的价格战让今年电商市场显得相对平静，“搅局者”腾讯旗下易迅网正欲打破这种局面。近日易迅网宣布从今日开始，针对京东商城、苏宁易购和国美在线三家的商品售价，启动名为“价格终结者”的保价行动，并持续一个月。\r\n</p>\r\n<p>\r\n	　　业内人士表示，历经前期的探索与积累，传统企业电商已经显示出了强大的实力与爆发力，国美苏宁此时趁主要竞争对手休养生息之际，自然不会放过进一步抢占市场份额的机会。目前，低价竞争仍是最有效的手段，因此国美苏宁势必掀起新一轮的价格大战。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　那么，在国美苏宁继续发力挑战电商现有格局的2013年里，京东是否会重回价格战？\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　“在目前家电类电商利润稀薄的状况下，价格战等同于自杀式流血，不可持续。今年电商的主题是通过合理的成本控制，升级营销手段来保持经营利润，促进整个电商行业健康可持续发展。”对于京东“哑火”，新七天电器品牌总监田原认为，京东商城在独立B2C市场上的垄断性优势，已经让其不屑于打价格战。\r\n</p>\r\n　　有独立电商观察者对记者表示，包括京东和国美苏宁在内，电商整体还是会保持一个基本低价的态势，但真正的竞争还会是在售后体验上，而售后体验的经验积累和物流体系建设，也绝非一日之功，各大电商还需投入更多精力提升用户体验。<br />\r\n<br />\r\n<br />', 12, b'1', b'0', NULL, NULL, NULL, '电商变革 电商造节促销欲打翻身仗', 1);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(31, now(), now(), NULL, '酷酷搭配逛街去 时尚美范赚足回头率<br />\r\n<br />\r\n　　如何装扮自己，才能赢得路人们的注意呢。对于许许多多的爱美的女性朋友们来说，学习时尚的服饰搭配技巧是非常重要的一个课题。接下来，就让小编来告诉你吧，一定要仔细学习哦，相信一定可以找到属于你自己的搭配风格的。<br />\r\n&nbsp;<br />\r\n　　民族风的披肩，喜欢旅游的女孩们，外出穿上这款yy，非常有感觉哦!独具特色的民族风花纹图案，穿上它超级显个性的。内搭最百搭的黑色打底毛衫，下身配搭黑色紧身牛仔裤+皮质过膝长靴，很时髦帅酷哦!', 2, b'1', b'0', NULL, NULL, NULL, '酷酷搭配逛街去 时尚美范赚足回头率', 1);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(32, now(), now(), NULL, 'google快递<br />\r\n<br />\r\n　　今天，Google 宣布了其 Google 购物快递(Shopping Express) 服务正式上线，与其配套的当日送达服务只在美国部分地区试运营。截至目前，已有包括 Target/Walgreens 在内的数十家零售商合作伙伴。<br />\r\n<br />\r\n　　此前有媒体猜测，Google 可能会推出 64-69 美元 / 年的价格来同 Amazon 竞争，但就目前的情况看，Google 似乎仍未拿出一个合理定价方案，未来会根据零售商以及首批试用用户数据，制定合理的价格。首批试用者也可以免费享受六个月的当日送达服务。<br />\r\n<br />\r\nGoogle快递服务<br />\r\n<br />\r\n　　对于普通消费者来说，好处是购物时除了 Amazon，他们又多了一个选择；而商家也会因此带来一批新的用户。<br />\r\n<br />\r\n　　自此，Google 又多了一重“电商”的身份，其他在线零售商要小心了，尤其是电商巨头 Amazon。', 1, b'1', b'0', NULL, NULL, NULL, '谷歌正式进军电商行业 推购物快递服务', 1);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(33, now(), now(), NULL, '<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 越来越多的70后、80后发现，身边的父母长辈开始聊网购了，甚至有不少人已经能在网上购物。在这一现象的背后，网购已经成为人们主流的消费方式和拉动经济增长的新引擎，国内零售业也由此进入了新旧经济模式转型的关键节点。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　在今年的全国两会上，还有不少50、60后代表饶有兴致地谈起网购经历。就连广大农村地区的居民也加入了电子商务大军，不少农民还扯条网线当上了“网商”，直接把家里的土特产卖到了全国各地。根据中国互联网络信息中心（CNNIC）发布的报告，截至2012年12月底，我国网络购物用户规模达到2.42亿。艾瑞咨询数据显示，2012年中国网络购物市场交易规模达1.3万亿元，在社会消费品总零售额的占比达到6.2%。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　在网购规模逐年扩大的同时，百货商场沦落为“试衣间”的趋势也越来越明显。就连年销售额400多亿、拥有银泰百货等金字招牌的银泰集团董事长沈国军也公开表示：“电子商务发展势不可挡，传统零售业务不变革的话是死路一条。”而在传统零售商尝试转型之前，不少制造商早已加入了网销大军。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　为此电商服务平台为创业者电商提供最好的服务，无论有无开网店的经验，电商服务平台的技术人员都会帮您实现，并将您培养成一名成功的创业者。省钱省力，上手迅速。一个完整的开网店过程：谋划网站功能--找电商服务平台签合同做网站，空间费，带宽费，域名费--网站开发费用--学习网店后台操作--开通支付功能--向网店上传商品--开始运作。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n　　企业尤其是传统企业想要做好电子商务，想要进军电子商务市场，想要在电子商务市场竞争中逆流而上，必要的电子商务力量与支持绝对不能少。', 2, b'1', b'0', NULL, NULL, NULL, '创业者电商 促进中国经济生活转型', 1);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(34, now(), now(), NULL, '　　刘女士是经常去马连道，因为她爱喝茶，但是从今年8月份后，她再也不去马连道了，原来是她从网上购茶了，之前刘女士是从来不相信网上购物的，那为什么后来就从网上购物了呢。<br />\r\n<br />\r\n　　事情的经过是这样的，今年八月中旬的一天，刘女士又到日子要去马连道买茶了，正准备出门，女儿说，现在网上购物又省心，又省力，何必跑那么远呢，网上有一个专门卖茶的网站叫国茶商城还不错，你可以上去看看，刘女士本来是不相信网上购物的，别看天天上网，也只是聊个天打个字，从来不在网上购物，可这次听女儿说的这么好，正好今天车又限号，她也不想大热天的挤公交，心想就试试吧，她打开国茶商城页面一看，好家伙，品种还很全，自己能见到的茶叶，这茶城里全有，价格也公道，正看着呢，结果瞧见一个茶叶竟然零元销售，刘女士心想估计又是一个不靠谱的网站，反正是零元，试一下吧。就点了购买，完了就关了页面了。之后又坐车去马连道。<br />\r\n<br />\r\n　　本来刘女士也不以为意，估计人家网站也不可能零元销售，估计又是骗子网站，可是下午回家后，竟然有人打电话问她是不是在国茶商城定过茶，刘女士有点觉得惊讶了，最让他惊讶的是下午两点竟然有人给他把价值二百多元的茶送过来了，刘女士没掏一分钱。<br />\r\n<br />\r\n<p>\r\n	　　事后刘女士通过问网站配送人员才知道，本来国茶商城在测试阶段，所以有些细节检查的并不仔细，并没有想到会有人去真正的购买，可是没有想到有人下单了，看到定单后，商城的销售人员立即打电话给了领导，领导当时就做出决定：赔钱也要做到诚售，既然标了零元就要做到。这样才有了下午的一幕，最后刘女士一分钱没花买到了价值二百多的六安瓜片。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 事情传出后，国茶商城被众网友评为了最诚信电商。由此可见信誉、品牌在消费者看来是责任是义务，是商家对待消费者的态度。而对商家而言信誉、诚信则是消费者最好的评价与支持。诚信为本 千古不变。', 4, b'1', b'0', NULL, NULL, NULL, '看国茶商城被网友评为最诚信电商之一，言电商信誉、品牌塑造。', 1);
insert into xx_article (id, create_date, modify_date, author, content, hits, is_publication, is_top, seo_description, seo_keywords, seo_title, title, article_category) values(35, now(), now(), NULL, '<p>\r\n	　&nbsp; 受全球经济增长迟缓的影响，2012年中国电子商务市场整体增速有所回落，艾瑞咨询数据显示，2012年中国电子商务市场交易规模达8.1万亿元；从市场结构来看，网络购物突破万亿元大关，比较2011年有提升，在线旅游份额保持稳定，而B2B占比下降2个百分点。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　市场规模：2012年中国电子商务市场交易规模8.1万亿元\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n　　艾瑞咨询统计数据显示，2012年中国电子商务市场整体交易规模为8.1万亿元，增长27.9%，与2011年32.8%的增速相比，下降了近5个百分点；其中2012Q4整体交易规模为2.4万亿元，环比增长16.2%，同比增长27.5%。<br />\r\n<p>\r\n	　　艾瑞咨询分析认为，电子商务市场规模增速有所回落，其原因主要是2012年国际贸易增速回落，欧洲债务危机不断加剧，美国经济复苏缓慢，全球经济收缩步伐加快；此外海关总署最新发布的数据也体现出这个态势，2012年全年中国进出口总额为38667.6亿美元，较2011年增长6.2%，而2011年同期的增速为22.5%，下降16个百分点。艾瑞咨询认为，当前经济环境对企业间电子商务行为产生较大影响，而B2B部分交易规模占电商整体八成以上，B2B市场规模在2012年增速放缓直接影响了整体规模增速。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　市场格局：电商频繁促销活动驱动网购市场份额的增长\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n　　艾瑞咨询统计数据显示，2012年电子商务市场细分行业结构中，中小企业B2B电子商务占比53.3%，规模以上B2B占28.3%，企业间电子商务合计占81.6%；网络购物交易规模市场份额达到16.0%；在线旅游交易规模占比为2.1%。<br />\r\n　　艾瑞咨询分析认为，2012年中国网络购物市场份额有所提升，其因素是核心电商企业通过各种形式的促销，深入挖掘网购用户的消费潜力，从而带动了网购市场的快速增长。仅“双十一”仅淘宝就创造了191亿的交易业绩，远超美国2012年“网购星期一”15亿美元交易额水平。未来随着传统企业大规模进入电商行业、移动互联网的快速发展促使移动购物日益便捷，中国网络购物市场整体还将保持较快增长速度。<br />\r\n　　此外，在线旅游市场虽然占比较低，但近年来受机票、酒店、旅游度假等细分市场不同程度的驱动，一直保持30%以上的增长，逐渐成为电子商务市场重要的组成部分。<br />\r\n<br />', 12, b'1', b'0', NULL, NULL, NULL, '中国电商交易额8.1万亿 网购占比提升', 1);

