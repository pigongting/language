use `db_k-saas-tenant`;

CREATE TABLE `t_tmp_klm_community` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`k_saas_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'KSAAS小区ID',
	`kl_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'K生活小区ID',
	`meta_created` DATETIME NOT NULL COMMENT '创建时间',
  `meta_updated` DATETIME NOT NULL COMMENT '最后一次修改时间',
  `meta_logic_flag` INT(11) DEFAULT 0 COMMENT '是否已经逻辑删除 1已删除  0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='K生活小区与SAAS小区映射表';


INSERT INTO `db_k-saas-tenant`.t_tmp_klm_community (
  k_saas_id, kl_id, meta_created, meta_updated, meta_logic_flag
) SELECT
     t2.k_saas_id ,
     t1.`eid`,
     NOW(),
     NOW(),
     1
FROM `db_k-life`.giga_jzy_estate_affiliated as t1
      INNER JOIN `db_k-saas-tenant`.t_tmp_sym_community  as t2 ON t1.OrgID = t2.sy_id
      order by t1.eid;

SELECT count(*) FROM t_tmp_klm_community;

SELECT count(*) FROM `db_k-saas-tenant`.t_tmp_sym_community;
SELECT count(*) FROM  `db_k-life`.giga_jzy_estate_affiliated;

update `db_k-saas-tenant`.t_pms_register_gasket set is_authenticated = 2 where is_authenticated = 0;


truncate table `db_k-gateway`.t_pms_entry_exit_record;
truncate table `db_k-saas`.t_ifs_vehicle;
truncate table `db_k-saas-tenant`.t_pms_register_gasket;
truncate table `db_k-saas-tenant`.t_pms_logic_parking_vehicle;
truncate table `db_k-saas-tenant`.t_pms_logic_parking;
truncate table `db_k-saas-tenant`.t_pms_parking;
truncate table  `db_k-saas-tenant`.t_pms_logic_parking_vehicle_user;
truncate table `db_k-saas-tenant`.t_pms_pay_temp_bill;
truncate table `db_k-saas-tenant`.t_pms_pay_per_period;
truncate table `db_k-saas-tenant`.t_pms_pay_per_period_recharge;

-- t_pms_parking
INSERT INTO `db_k-saas-tenant`.t_pms_parking (
  cmn_community_id,
  community_name,
  provider_id,
  provider_parking_id,
  name,
  charge_descriptiON,
  capture_photo_url,
  state,
  meta_created,
  meta_updated,
  meta_logic_flag
) SELECT
     tmp.k_saas_id as org_community_id,
     estate.name as estate_name,
     1,
     giga_park.parkid as keytop_park_id,
     giga_park.name as park_name,
     giga_park.payrule,
     giga_park.picurl,
     1,
     NOW(),
     NOW(),
     1
FROM
   `db_k-life`.giga_ketuo_car_parking_info as giga_park
    INNER JOIN `db_k-saas-tenant`.t_tmp_klm_community as tmp
       ON giga_park.eid = tmp.kl_id
    INNER JOIN `db_k-life`.giga_estate as estate
       ON giga_park.eid = estate.id;


-- t_pms_logic_parking
INSERT INTO `db_k-saas-tenant`.t_pms_logic_parking (
    id,
    cmn_community_id,
    name,
    charge_descriptiON,
    capture_photo_url,
    state,
    meta_created,
    meta_updated,
    meta_logic_flag
) SELECT
       id,
       cmn_community_id,
       name,
       charge_descriptiON,
       capture_photo_url,
       state,
       meta_created,
       meta_updated,
       meta_logic_flag
FROM
     `db_k-saas-tenant`.t_pms_parking;


-- t_ifs_vehicle
INSERT INTO `db_k-saas`.t_ifs_vehicle (
    license_plate,
    -- owner_true_name,
    meta_created,
    meta_updated,
    meta_logic_flag
) SELECT
       distinct card,
       NOW(),
       NOW(),
       -- is_del
       1
FROM `db_k-life`.giga_ketuo_car_info where is_del = 0 AND `code` not in ('13824343165');



-- t_pms_logic_parking_vehicle
INSERT INTO `db_k-saas-tenant`.t_pms_logic_parking_vehicle (
    vehicle_id,
    logic_parking_id,
    is_authenticated,
    is_locked,
    meta_created,
    meta_updated,
    meta_logic_flag
) SELECT
     distinct a.vehicle_id ,
     logic_parking.id as logic_parking_id,
     a.status,
     a.`lock` as is_locked,
     NOW(),
     NOW(),
     1
FROM
      `db_k-saas-tenant`.t_tmp_klm_community as tmp
    INNER JOIN
(
    SELECT
       vehicle.id as vehicle_id, car.eid, car.card, car.code, car.status, car.`lock`
    FROM
         `db_k-life`.giga_ketuo_car_info as car
          INNER JOIN
             `db_k-saas`.t_ifs_vehicle as vehicle ON car.card = vehicle.license_plate
    where is_del = 0 AND car.card
              not in ('粤B00001','粤B00002', '粤B00003', '粤B00004', '粤B00005', '粤B00006')
)
 as a ON a.eid = tmp.kl_id
  INNER JOIN
    `db_k-saas-tenant`.t_pms_logic_parking as logic_parking
          ON tmp.k_saas_id = logic_parking.cmn_community_id;



-- t_pms_logic_parking_vehicle_user
INSERT INTO `db_k-saas-tenant`.t_pms_logic_parking_vehicle_user (
    vehicle_logic_parking_id,
    sso_user_id,
    is_authenticated,
    phONe,
    license_plate,
    meta_created,
    meta_updated,
    meta_logic_flag
) SELECT
      parking_vehicle.id as logic_parking_vehicle_id,
      a.ssouserid,
      a.authenticated,
      a.phONe,
      a.plate,
      NOW(),
      NOW(),
      1
FROM (
        SELECT 
            distinct vehicle.id            as vehicle_id,
            vehicle.license_plate as plate,
            tmp.k_saas_id,
            logic_parking.id as logic_parking_id,
            member.ssouserid,
            member.phONe,
            carinfo.status as authenticated
        FROM `db_k-life`.giga_ketuo_car_info as carinfo
             INNER JOIN `db_k-saas`.t_ifs_vehicle as vehicle ON carinfo.card = vehicle.license_plate
             INNER JOIN `db_k-saas-tenant`.t_tmp_klm_community as tmp ON carinfo.eid = tmp.kl_id
             INNER JOIN `db_k-saas-tenant`.t_pms_logic_parking as logic_parking 
                ON tmp.k_saas_id = logic_parking.cmn_community_id AND tmp.kl_id = carinfo.eid
             INNER JOIN `db_k-life`.giga_member as member ON carinfo.code = member.phONe
        where carinfo.is_del = 0
        AND carinfo.card not in ('粤B00001', '粤B00002', '粤B00003', '粤B00004', '粤B00005', '粤B00006')
) a 
    INNER JOIN `db_k-saas-tenant`.t_pms_logic_parking_vehicle as parking_vehicle
        ON parking_vehicle.vehicle_id = a.vehicle_id
        AND parking_vehicle.logic_parking_id = a.logic_parking_id;


-- t_pms_pay_per_period
INSERT INTO `db_k-saas-tenant`.t_pms_pay_per_period (
    card_no,
    vehicle_logic_parking_id,
    valid_start_time,
    valid_end_time,
    meta_created,
    meta_updated,
    meta_logic_flag
) SELECT
     '',
     parking_vehicle.id as logic_parking_vehicle_id,
      NOW(),
      a.valid_to,
      NOW(),
      NOW(),
      1
FROM
    `db_k-saas-tenant`.t_pms_logic_parking_vehicle as parking_vehicle
     INNER JOIN (
        SELECT
            parking.id as logic_parking_id,
            b.vehicle_id,
            b.valid_to,
            b.card
        FROM
             `db_k-saas-tenant`.t_pms_logic_parking as parking
              INNER JOIN (
              SELECT
                    distinct kd.card,
                    vehicle.id as vehicle_id,
                    tmp.k_saas_id as cmn_community_id,
                    kd.valid_to
              FROM `db_k-life`.giga_ketuo_yueka_valid_date as kd
                  INNER JOIN `db_k-saas-tenant`.t_tmp_klm_community as tmp
                       ON tmp.kl_id = kd.eid
                  INNER JOIN `db_k-saas`.t_ifs_vehicle as vehicle
                       ON vehicle.license_plate = kd.card
              ) b ON b.cmn_community_id = parking.cmn_community_id
     ) a ON a.vehicle_id = parking_vehicle.vehicle_id
          AND a.logic_parking_id = parking_vehicle.logic_parking_id;

-- end

-- '18576785036', '13824343165', '18565762573', '17620370869' 
-- 过滤测试数据添加的车牌
-- period recharge
INSERT INTO `db_k-saas-tenant`.t_pms_pay_per_period_recharge (
    pay_per_period_id,
    payment_id,
    charge_fee,
    pay_state,
    deadline,
    charge_time,
    duratiON,
    license_plate,
    provider_id,
    provider_order_no,
    pay_provider_id,
    pay_provider_trade_no,
    community_name,
    meta_created, meta_updated, meta_logic_flag
) SELECT
    period.id as period_id,
    0,
    FORMAT(c.total_fee / 100, 2),
    c.status,
    c.n_deadline,
    FROM_UNIXTIME(c.pay_time),
    c.duratiONs,
    c.plate,
    1,
    c.provider_no,
    1,
    c.pay_provider_no,
     '',
     NOW(),
     NOW(),
     1
FROM
     `db_k-saas-tenant`.t_pms_pay_per_period as period
INNER JOIN (
SELECT
   parking_vehicle.id as logic_parking_vehicle_id,
   b.provider_no,
   b.pay_provider_no,
   b.total_fee,
   b.status,
   b.duratiONs,
   b.n_deadline,
   b.pay_time,
   b.plate
FROM `db_k-saas-tenant`.t_pms_logic_parking_vehicle as parking_vehicle
INNER JOIN
( SELECT
  a.vehicle_id, logic_parking.id as logic_parking_id,
  a.pay_provider_no, a.provider_no, a.total_fee, a.status, a.duratiONs, a.n_deadline, a.pay_time, a.plate
FROM (SELECT
             vehicle.id as vehicle_id,
             tmp.k_saas_id as community_id,
             period_order.pid as pay_provider_no,
             period_order.orderNo as provider_no ,
             period_order.payable as total_fee,
             period_order.ispay as status,
             period_order.num as duratiONs,
             period_order.new_endtime as n_deadline,
             period_order.paytime as pay_time,
             period_order.card as plate
      FROM `db_k-life`.giga_ketuo_yueka_order as period_order
             INNER JOIN `db_k-saas`.t_ifs_vehicle as vehicle ON period_order.card = vehicle.license_plate
             INNER JOIN `db_k-saas-tenant`.t_tmp_klm_community as tmp ON period_order.eid = tmp.kl_id
      where period_order.code not in
            ('18576785036', '13824343165', '18565762573', '17620370869') AND period_order.new_endtime <> 0
) a
       left join `db_k-saas-tenant`.t_pms_logic_parking as logic_parking ON a.community_id = logic_parking.cmn_community_id
) b ON parking_vehicle.vehicle_id = b.vehicle_id AND parking_vehicle.logic_parking_id = b.logic_parking_id
           ) c ON period.vehicle_logic_parking_id = c.logic_parking_vehicle_id;

-- end

-- '18576785036', '13824343165', '18565762573', '17620370869' 
-- 过滤测试数据添加的车牌
-- temp _bill order

-- t_pms_pay_temp_bill
INSERT INTO `db_k-saas-tenant`.t_pms_pay_temp_bill (
    vehicle_logic_parking_id,
    entry_time,
    exit_time,
    total_fee,
    license_plate,
    provider_id,
    provider_order_no,
    pay_provider_id,
    pay_provider_trade_no,
    pay_state,
    meta_created,
    meta_updated,
    meta_logic_flag
)  SELECT
   parking_vehicle.id as logic_parking_vehicle_id,
   b.entry_time,
   date_add(b.entry_time, INTERVAL b.delay_time MINUTE_SECOND ) ,
   b.total_fee,
   b.plate,
   1,
   b.provider_no,
   1,
   b.pay_provider_no,
   b.status,
   FROM_UNIXTIME(b.pay_time),
   NOW(),
   1
FROM `db_k-saas-tenant`.t_pms_logic_parking_vehicle as parking_vehicle
INNER JOIN (
    SELECT a.vehicle_id,
                   logic_parking.id as logic_parking_id,
                   a.pay_provider_no,
                   a.provider_no,
                   a.total_fee,
                   a.status,
                   a.pay_time,
                   a.plate, a.entry_time, a.delay_time
            FROM (SELECT vehicle.id           as vehicle_id,
                         tmp.k_saas_id        as community_id,
                         period_order.pid     as pay_provider_no,
                         period_order.orderNo as provider_no,
                         period_order.payable as total_fee,
                         period_order.ispay   as status,
                         period_order.paytime as pay_time,
                         period_order.card    as plate,
                         period_order.entrytime as entry_time,
                         period_order.delayTime as delay_time
                  FROM `db_k-life`.giga_ketuo_linshi_order as period_order
                        INNER JOIN `db_k-saas`.t_ifs_vehicle as vehicle ON period_order.card = vehicle.license_plate
                        INNER JOIN `db_k-saas-tenant`.t_tmp_klm_community as tmp ON period_order.eid = tmp.kl_id
                  where period_order.code not in ('18576785036', '13824343165', '18565762573', '17620370869')) a
                        left  join `db_k-saas-tenant`.t_pms_logic_parking as logic_parking
                            ON a.community_id = logic_parking.cmn_community_id
)  b
ON parking_vehicle.vehicle_id = b.vehicle_id AND parking_vehicle.logic_parking_id = b.logic_parking_id
-- end

-- SELECT id FROM `db_k-saas-tenant`.t_pms_pay_per_period group by vehicle_logic_parking_id having count(*) > 1