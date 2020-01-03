import React, {useState, useEffect} from 'react'
import '../static/style/components/header.css'
import { Row, Col, Menu, Icon } from 'antd'

import servicePath from '../config/apiUrl'
import Router from 'next/router'
import Link from 'next/link'
import axios from 'axios'

const Header = ()=> {

    const [navArray, setNavArray] = useState([])

    // 放空[] 表示只有第一次进入的时候才执行
    useEffect(()=> {
        const fetchData = async ()=> {
            const result = await axios(servicePath.getTypeInfo)
            if (result.data) {
                setNavArray(result.data.data || [])
            }
        }
        fetchData()
    }, [])

    const handleClick = (e) => {
        if (e.key === '0') {
            Router.push('/')
        } else {
            Router.push('/list?id=' + e.key)
        }
    }

    return <div className="header">
        <Row type="flex" justify="center">
            <Col xs={24} sm={24} md={10} lg={15} xl={12}>
                <span className="header-logo">MFNothing</span>
                <span className="header-text">have fun, enjoy life.</span>
            </Col>
            <Col xs={0} sm={0} md={14} lg={8} xl={6}>
                <Menu mode="horizontal" onClick={handleClick}>
                    <Menu.Item key="0">
                        <Icon type="home" />
                        首页
                    </Menu.Item>
                    {
                        navArray.map((item, index) => {
                            return (
                                <Menu.Item key={item.id}>
                                    <Icon type={item.icon} />
                                    {item.typeName}
                                </Menu.Item>
                            )
                        })
                    }
                </Menu>
            </Col>
        </Row>
    </div>
}

export default Header