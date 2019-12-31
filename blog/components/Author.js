import {Avatar, Divider} from 'antd'
import '../static/style/components/author.css'

const Author = () => {
    return (
        <div className="author-div comm-box">
            <div><Avatar size={100} src="http://c-driver-servercp.qunarzz.com/c_driver_server_c_driver_server/0c57cba868cf075c177c1e0af7ac1174.png" shape="circle"/></div>
            <div className="author-introduction">
                MFNothing
                {/* 分割线 */}
                <Divider>社交账号</Divider>
                <Avatar size={28} icon="github" className="account" />
                <Avatar size={28} icon="qq" className="account" />
                <Avatar size={28} icon="wechat" className="account" />
            </div>
        </div>
    )
}

export default Author