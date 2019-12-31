import React,{useState} from 'react'
import Head from 'next/head'
import {Row, Col , Icon ,Breadcrumb  } from 'antd'

import Header from '../components/Header'
import Author from '../components/Author'
import Advert from '../components/Advert'
import Footer from '../components/Footer'
import '../static/style/pages/detail.css'

const Detailed = () => (
  <>
    <Head>
      <title>Detailed</title>
    </Head>
    <Header />
    <Row className="comm-main" type="flex" justify="center">
      <Col className="comm-left" xs={24} sm={24} md={16} lg={18} xl={14}>
        <div>
          <div className="bread-div">
            <Breadcrumb>
              <Breadcrumb.Item><a href="/">首页</a></Breadcrumb.Item>
              <Breadcrumb.Item><a href="/">视频列表</a></Breadcrumb.Item>
              <Breadcrumb.Item>xxx</Breadcrumb.Item>
            </Breadcrumb>
          </div>
          <div>
            <div className="detailed-title">
              React实战视频教程-技术胖Blog开发（更新第10集）
            </div>
            <div className="list-icon center">
              <span><Icon type="calendar"/>2019-12-30</span>
              <span><Icon type="folder"/>视频</span>
              <span><Icon type="fire"/>42人</span>
            </div>
            <div className="detailed-content">
              markdown 内容
            </div>
          </div>
        </div>
      </Col>
      <Col className="comm-right" xs={0} sm={0} md={7} lg={5} xl={4}>
        <Author />
        <Advert />
      </Col>
    </Row>
    <Footer />
 </>
)

export default Detailed