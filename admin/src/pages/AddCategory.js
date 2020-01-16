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
    const [parentCategoryIds, setParentCategoryIds] = useState([])  // 父级分类名称

    // 只首次进入时执行，相当于componentDidMount
    useEffect(() => {
        getParentCategoryNames()
    }, [])

    // 请求 <----- 开始 ------>

    const getParentCategoryNames = async () => {
        const { data } = await axios({
            method: 'get',
            url: servicePath.getParentCategoryNames,
            header: { 'Access-Control-Allow-Origin': '*' },
            withCredentials: true
        })
        if (data && data.data) {
            setParentCategoryIds(data.data || [])
        }
    }

    const onSubmitClick = async () => {
        if (!categoryName) {
            message.error('请填写分类名称')
        }
        const resutl = await axios({
            method: 'post',
            url: servicePath.addCategory,
            header: { 'Access-Control-Allow-Origin': '*' },
            withCredentials: true,
            data: {
                categoryName,
                categoryIcon,
                parentCategoryIds
            }
        })
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
                        mode="multiple"
                        showSearch
                        style={{ padding: '8px 0 8px 8px', flex: 1}}
                        placeholder="输入父级分类名称（可不选择）"
                        optionFilterProp="children"
                        filterOption={(input, option) =>
                            option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
                        }
                    >
                        {
                            parentCategoryIds.map((item) => (
                                <Option value={item.id}>{item.categoryName}</Option>
                            ))
                        }
                    </Select>
                </div>
            </Row>
            <Row gutter={4}>
                <div className="category-button">
                    <Button type="primary" block onClick={onSubmitClick}>提交</Button>
                </div>
            </Row>
        </div>
    )
}

export default AddCategory