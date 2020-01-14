import React, { useState, useEffect } from 'react';
import marked from 'marked'
import '../static/css/AddArticle.css'
import { Row, Col, Input, Select, Button, DatePicker, message } from 'antd'
import axios from 'axios'
import servicePath from '../config/apiUrl'
import '../static/css/AddCategory.css'

const { Option } = Select


function AddCategory(props) {
    return (
        <div>
            <Row gutter={4}>
                <div className="category-input">
                    <span>分类名称: </span>
                    <Input placeholder="输入分类名称"/>
                </div>
            </Row>
            <Row gutter={4}>
                <div className="category-input">
                    <span>父类分类名称: </span>
                    <Select
                        showSearch
                        style={{ padding: '8px 0 8px 8px', flex: 1}}
                        placeholder="输入父类分类名称（可不选择）"
                        optionFilterProp="children"
                        filterOption={(input, option) =>
                            option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
                        }
                    >
                        <Option value="jack">Jack</Option>
                        <Option value="lucy">Min</Option>
                        <Option value="tom">Tom</Option>
                    </Select>
                </div>
            </Row>
            <Row gutter={4}>
                <div className="category-button">
                    <Button type="primary" block>提交</Button>
                </div>
            </Row>
        </div>
    )
}

export default AddCategory