import React from 'react';
import { BrowserRouter as Router, Route } from "react-router-dom";
import Login from './Login'
import AdminIndex from './AdminIndex'
function Main() {
    return (
        <Router>
            <Route path="/" exact component={Login} />
            {/* exact 默认为贪婪匹配，只要有就显示，加了exact表示，全匹配，必须一致才能显示 */}
            <Route path="/index/" breadcrumbName="home" component={AdminIndex} />
        </Router>
    )
}
export default Main