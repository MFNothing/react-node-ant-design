import React,{useState} from 'react'
import Head from 'next/head'
import {Row, Col , Icon, Breadcrumb, Affix} from 'antd'

import Header from '../components/Header'
import Author from '../components/Author'
import Advert from '../components/Advert'
import Footer from '../components/Footer'
import '../static/style/pages/detail.css'
import axios from 'axios'


// import ReactMarkdown from 'react-markdown'
// import MarkNav from '../components/markdown/MarkdownNavBar'
// import 'markdown-navbar/dist/navbar.css'

import marked from 'marked'
import hignlights from 'highlight.js'
import 'highlight.js/styles/monokai-sublime.css'

import Tocify from '../components/tocify.tsx'

import servicePath from '../config/apiUrl'


const Detail = (props) => {

  const renderer = new marked.Renderer()

  const tocify = new Tocify()
  renderer.heading = function(text, level, raw) {
    const anchor = tocify.add(text, level);
    return `<a id="${anchor}" href="#${anchor}" class="anchor-fix"><h${level}>${text}</h${level}></a>\n`;
  };

  marked.setOptions({
    renderer: renderer,
    // 采用Git风格的解析
    gfm: true,
    // 是否容错，默认不容错
    pedantic: false,
    // 原始输出，忽略html标签 默认为true
    sanitize: false,
    // 是否输出表格，gfm需要为true
    tables: true,
    // 换行符
    breaks: false,
    // 列表符, 默认为false
    smartLists: true,
    smartypants: false,
    // 代码高亮
    highlight: function(code) {
      // 使用 highlight.js 让代码高亮
      return hignlights.highlightAuto(code).value
    }
  })

  let html = marked(props.article_content)
  return (
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
              <div className="detailed-content"
                dangerouslySetInnerHTML={{__html: html}}>
              </div>
            </div>
          </div>
        </Col>
        <Col className="comm-right" xs={0} sm={0} md={7} lg={5} xl={4}>
          <Author />
          <Advert />
          {/* Affix 增加固定效果 */}
          <Affix offsetTop={5}>
            <div className="detailed-nav comm-box">
              <div className="nav-title">文章目录</div>
              <div className="toc-list">
                {tocify && tocify.render()}
              </div>
            </div>
          </Affix>
        </Col>
      </Row>
      <Footer />
   </>
  )
}

Detail.getInitialProps = async (context) => {
  let id = context.query.id
  const promise = new Promise((resolve) => {
    axios.get(servicePath.getArticleById+id).then(
      (res)=>{
        console.log(res.data.data[0])
        resolve(res.data.data[0])
      }
    )
  })
  return await promise
}

export default Detail