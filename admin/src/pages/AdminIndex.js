import React, { useState } from 'react';
import { Layout, Menu, Icon } from 'antd';
import '../static/css/AdminIndex.css'

import { Route } from "react-router-dom";
import AddArticle from './AddArticle'
import ArticleList from './ArticleList'
import AddCategory from './AddCategory'
import CategoryList from './CategoryList'
import AddPhoto from './AddPhoto'
import PhotoList from './PhotoList'

const { Content, Footer, Sider } = Layout;
const { SubMenu } = Menu;


function AdminIndex(props) {

  const [collapsed, setCollapsed] = useState(false)

  const onCollapse = collapsed => {
    setCollapsed(collapsed)
  };

  const handleClickArticle = e => {
    if (e.key === 'addArticle') { // 添加文章
      props.history.push('/index/addArticle/')
    } else if (e.key === 'articleList') { // 文章列表
      props.history.push('/index/articelList/')
    } else if (e.key === 'addCategory') { // 添加分类
      props.history.push('/index/addCategory/')
    } else if (e.key === 'categoryList') { // 分类列表
      props.history.push('/index/categoryList/')
    } else if (e.key === 'addPhoto') { // 添加图片
      props.history.push('/index/addPhoto/')
    } else if (e.key === 'photoList') { // 图片列表
      props.history.push('/index/photoList/')
    }
  }

  const renderMenu = () => {
    const menuData = [
      {title: '分类管理', items: [{key: 'addCategory', title: '添加分类'}, {key: 'categoryList', title: '分类列表'}]},
      {title: '文章管理', items: [{key: 'addArticle', title: '添加文章'}, {key: 'articleList', title: '文章列表'}]},
      {title: '图片管理', items: [{key: 'addPhoto', title: '添加图片'}, {key: 'photoList', title: '图片列表'}]},
      {title: '用户管理'}
    ]
    return (
      <Menu defaultSelectedKeys={['文章管理']} mode="inline" defaultOpenKeys={['文章管理']}>
        {
          menuData.map((menu) => {
            if (menu.items) {
              return (
                <SubMenu
                  key={menu.title}
                  onClick={handleClickArticle}
                  title={
                    <span>
                      <Icon type="desktop" />
                      <span>{menu.title}</span>
                    </span>
                  }
                >
                  {
                    menu.items.map((item) => (
                       <Menu.Item key={item.key}>{item.title}</Menu.Item>
                    ))
                  }
                </SubMenu>
              )
            } else {
              return (
                <Menu.Item key="2">
                  <Icon type="desktop" />
                    <span>{menu.title}</span>
                </Menu.Item>
              )
            }
          })
        }
      </Menu>
    )
  }

  return (
    <Layout style={{ minHeight: '100vh' }}>
      <Sider theme="light" collapsible collapsed={collapsed} onCollapse={onCollapse}>
        <div className="logo" />
       {
         renderMenu()
       }
      </Sider>
      <Layout>
        {/* <Header style={{ background: '#f0f2f5', padding: 0, borderBottomStyle: 'solid', borderBottomWidth: 1, borderBottomColor: '#fff' }} /> */}
        <Content style={{ margin: '2px' }}>
          {/* 
            1.vw：1vw等于视口宽度的1%。
            2.vh：1vh等于视口高度的1%。
          */}
          <div style={{ padding: 24, background: '#fff', minHeight: '100%' }}>
            <div>
              <Route path="/index/" exact component={AddArticle} />
              <Route path="/index/addArticle/" exact component={AddArticle} />
              <Route path="/index/addArticle/:id" exact component={AddArticle} />
              <Route path="/index/articelList/" component={ArticleList} />
              <Route path="/index/addCategory/" exact component={AddCategory} />
              <Route path="/index/addCategory/:id" exact component={AddCategory} />
              <Route path="/index/categoryList/" component={CategoryList} />
              <Route path="/index/addPhoto/" exact component={AddPhoto} />
              <Route path="/index/addPhoto/:id" exact component={AddPhoto} />
              <Route path="/index/photoList/" component={PhotoList} />
            </div>
          </div>
        </Content>
        <Footer style={{ textAlign: 'center' }}>MFNothing.top</Footer>
      </Layout>
    </Layout>
  )

}

export default AdminIndex