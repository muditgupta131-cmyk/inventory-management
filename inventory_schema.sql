CREATE TABLE accounts (
  id              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active       BOOLEAN      NOT NULL DEFAULT TRUE,
  company_name    VARCHAR(150) NOT NULL,
  company_address TEXT         NOT NULL,
  gst_no          CHAR(15)     NULL,
  pan_no          CHAR(10)     NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_accounts_gst (gst_no),
  UNIQUE KEY uq_accounts_pan (pan_no)
);

CREATE TABLE users (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active   BOOLEAN      NOT NULL DEFAULT TRUE,
  account_id  INT UNSIGNED NOT NULL,
  name        VARCHAR(100) NOT NULL,
  email       VARCHAR(255) NOT NULL,
  phone_no    VARCHAR(15)  NULL,
  access_role VARCHAR(20)  NOT NULL DEFAULT 'staff',
  PRIMARY KEY (id),
  UNIQUE KEY uq_users_email (email)
);

CREATE TABLE materials (
  id            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active     BOOLEAN      NOT NULL DEFAULT TRUE,
  account_id    INT UNSIGNED NOT NULL,
  display_id    VARCHAR(32)  NOT NULL,
  name          VARCHAR(100) NOT NULL,
  material_unit VARCHAR(32)  NOT NULL DEFAULT 'kg',
  description   TEXT         NULL,
  PRIMARY KEY (id)
);

CREATE TABLE suppliers (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active   BOOLEAN      NOT NULL DEFAULT TRUE,
  account_id  INT UNSIGNED NOT NULL,
  display_id  VARCHAR(32)  NOT NULL,
  name        VARCHAR(150) NOT NULL,
  email       VARCHAR(255) NULL,
  phone_no    VARCHAR(15)  NULL,
  address     TEXT         NULL,
  gst_no      CHAR(15)     NULL,
  PRIMARY KEY (id)
);

CREATE TABLE consumers (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active   BOOLEAN      NOT NULL DEFAULT TRUE,
  account_id  INT UNSIGNED NOT NULL,
  display_id  VARCHAR(32)  NOT NULL,
  name        VARCHAR(150) NOT NULL,
  email       VARCHAR(255) NULL,
  phone_no    VARCHAR(15)  NULL,
  address     TEXT         NULL,
  gst_no      CHAR(15)     NULL,
  PRIMARY KEY (id)
);

CREATE TABLE orders (
  id          INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  created_at  DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at  DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active   BOOLEAN       NOT NULL DEFAULT TRUE,
  account_id  INT UNSIGNED  NOT NULL,
  display_id  VARCHAR(32)   NOT NULL,
  consumer_id INT UNSIGNED  NULL,
  supplier_id INT UNSIGNED  NULL,
  material_id INT UNSIGNED  NOT NULL,
  quantity    DECIMAL(12,3) NOT NULL,
  order_date  DATE          NOT NULL,
  status      VARCHAR(20)   NOT NULL DEFAULT 'pending',
  description TEXT          NULL,
  PRIMARY KEY (id)
);

CREATE TABLE shipments (
  id            INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  created_at    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active     BOOLEAN       NOT NULL DEFAULT TRUE,
  account_id    INT UNSIGNED  NOT NULL,
  display_id    VARCHAR(32)   NOT NULL,
  order_id      INT UNSIGNED  NULL,
  supplier_id   INT UNSIGNED  NULL,
  consumer_id   INT UNSIGNED  NULL,
  material_id   INT UNSIGNED  NOT NULL,
  quantity      DECIMAL(12,3) NOT NULL,
  tracking_id   VARCHAR(64)   NULL,
  shipment_date DATE          NULL,
  PRIMARY KEY (id)
);
