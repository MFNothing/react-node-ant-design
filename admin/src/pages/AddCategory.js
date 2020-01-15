import React, { useState, useEffect } from 'react';
import marked from 'marked'
import '../static/css/AddArticle.css'
import { Row, Col, Input, Select, Button, DatePicker, message } from 'antd'
import axios from 'axios'
import servicePath from '../config/apiUrl'
import '../static/css/AddCategory.css'

const { Option } = Select


function AddCategory(props) {
    const [categoryName, setCategoryName] = useState('')  // 分类名称
    const [categoryIcon, setCategoryIcon] = useState('')   // 分类图标
    const [parentCategoryName, setParentCategoryName] = useState('')  // 父级分类名称

    // 只首次进入时执行，相当于componentDidMount
    useEffect(() => {
        getParentCategoryNames()
    }, [])

    // 请求 <----- 开始 ------>

    const getParentCategoryNames = async () => {
        
    }

    // 请求 <----- 结束 ------>

    const onCategoryNameInputChange = (e) => {
        const {value = ''} = e.target
        setCategoryName(value)
    }

    const onCategoryIconInputChange = (e) => {
        const {value = ''} = e.target
        setCategoryIcon(value)
    }

    const onCateGoryNameInputChange = (e) => {
        const {value = ''} = e.target
        setCategoryName(value)
    }

    return (
        <div>
            <Row gutter={4}>
                <div className="category-input">
                    <span>分类名称: </span>
                    <Input placeholder="输入分类名称" onChange={onCateGoryNameInputChange}/>
                </div>
            </Row>
            <Row gutter={4}>
                <div className="category-input">
                    <span>分类图标: </span>
                    <Input placeholder="输入分类图标（根项可不填写）" onChange={onCategoryIconInputChange}/>
                </div>
            </Row>
            <Row gutter={4}>
                <div className="category-input">
                    <span>父级分类名称: </span>
                    <Select
                        showSearch
                        style={{ padding: '8px 0 8px 8px', flex: 1}}
                        placeholder="输入父级分类名称（可不选择）"
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