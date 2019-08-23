/* 开源-组件 */
import React from 'react';
import { Link } from 'react-router-dom';
/* 自研-组件 */
import Exception from '@/components/Exception';

export default () => (
  <Exception type="403" linkElement={Link} />
);
