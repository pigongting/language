/* 开源-组件 */
import React, { PureComponent, Fragment } from 'react';
import { Table } from 'antd';
/* 开源-工具 */
import classNames from 'classnames';
/* 自研-组件 */
import FilterForm from '@/components/BaseTable/FilterForm';
/* 自研-工具 */
import { handleResetTable, handleChangeTable, handleFoldTree } from '@/utilities/common';
/* 相对路径-样式 */
import styles from './index.less';

class BaseTable extends React.PureComponent {

  render() {
    const { title, operation, table, parent } = this.props;
    const { entities, totalRecords, pageSize, pageIndex } = table.pagination;

    return (
      <div className={styles.baseContentDataView}>
        <FilterForm
          folded={operation.folded}
          states={operation.states}
          filter={operation.filter}
          filters={operation.filters}
          onReset={handleResetTable.bind(parent)}
          loading={table.loading}
          operations={operation.operations}
          onFold={handleFoldTree.bind(parent)}
        />
        <div className={classNames(styles.baseContentTable, table.className)}>
          <Table
            bordered
            rowKey="id"
            scroll={{ x: 'max-content', y: '100%' }}
            loading={table.loading}
            columns={table.columns}
            dataSource={entities}
            pagination={{
              size: 'small',
              total: totalRecords || 0,
              showTotal: (total, range) => `总计 ${total} 条`,
              current: pageIndex + 1,
              pageSize,
              pageSizeOptions: ['10', '20', '50', '100', '1000'],
              showSizeChanger: true,
              showQuickJumper: true,
            }}
            onChange={handleChangeTable.bind(parent)}
          />
        </div>
        <div className={styles.baseContentFooter}></div>
      </div>
    );
  }
}

export default BaseTable;
