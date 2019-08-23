/* 开源-组件 */
import React, { Fragment } from 'react';
import { Collapse, Row, Col, Form } from 'antd';
/* 相对路径-样式 */
import styles from './index.less';

class FieldGroup extends React.PureComponent {

  render() {
    const { fieldGroup } = this.props;

    return (
      <div className={styles.fieldGroup}>
        <Collapse defaultActiveKey={Object.keys(fieldGroup)}>
          {fieldGroup.map((item, index) => {
            return (
              <Collapse.Panel header={item.title} key={index}>
                {item.fields.map((field, i) => <Form.Item key={i} label={field.label}>{field.render}</Form.Item>)}
              </Collapse.Panel>
            );
          })}
        </Collapse>
      </div>
    );
  }
}

export default FieldGroup;
