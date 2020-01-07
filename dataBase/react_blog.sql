-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: react_blog
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `admin_user` (
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES ('min','123123');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章编号 int类型',
  `type_id` int(11) NOT NULL COMMENT '文章类型编号 int类型',
  `title` varchar(255) NOT NULL COMMENT '文章标题，varchar类型',
  `article_content` text NOT NULL COMMENT '文章主体内容，text类型',
  `introduce` text COMMENT ' 文章简介，text类型',
  `addTime` int(11) DEFAULT NULL COMMENT '文章发布时间，int(11)类型',
  `view_count` int(11) NOT NULL COMMENT '浏览次数， int类型',
  `part_count` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,1,'React Hooks+Egg.js实战视频教程-技术胖Blog开发(更新43集)','## 初始 React 世界\n\n### React 简介\n\n* React 是一个 JavaScript 库，由 Facebook 在2013年开源。\n* React 把用户对象抽象成一个可复用组件。\n* 有了组件这层抽象，React把代码和真实渲染目标隔离开来。（因为这个所以可以开发网页和原生移动应用）\n\n#### 专注视图层\n\n* React 包含 View 和 Controller 的库。\n* 根据需要搭配 Flux 、Redux、GraphQL/Relay 来处理复杂的业务场景的应用。\n* 以 Minimal API Interface （最少API接口）为目标，只提供组件化相关的非常少量的接口。\n\n#### Virtual DOM\n\n**传统页面**\n\n![传统Dom更新](Traditional-DOM-Update.jpg)\n\n* 更新新页面时，都要手动操作 DOM 来进行更新。\n* DOM 操作性能消耗最大，而且这部分代码会让整体项目的代码变得难以维护\n\n**React**\n\n![传统Dom更新](React-Dom-Update.jpg)\n\n* React 把真实的 DOM 树转换成 JavaScript 对象树，也就是 Virtual DOM。\n* 每次数据更新后，重新计算 Virtual DOM，并和上一次生成的 Virtual DOM 做对比，对发生变化的部分做批量更新。\n* React 也提供直观的 ```shouldComponentUpdate``` 生命周期函数回调，减少数据变化后不必要的 Virtual DOM 对比国产，以保证性能。\n* Virtual DOM 的渲染方式也比传统 DOM 操作好一些，但并不明显，因为对比 DOM 节点也是需要计算资源的。\n* 最大的好处是方便与其他平台集成。React 可以根据对应平台输出对应的组件。（Web DOM，Android控件，iOS控件）\n\n#### 函数式编程\n\n* React 能充分利用很多函数方式去减少冗余的代码。\n* 由于它本身就是简单函数，所以易于测，所以便于测试。\n\n### JSX 语法\n\n#### JSX 的由来\n\nReact 是通过创建和更新虚拟元素来管理整个 Virtual DOM 的，但是虚拟元素仅仅通过 JavaScript 来描述会变得异常复杂，所以才有 JSX。\n\n虚拟元素可以理解为真实元素的对应，它的构建与更新都是在内存中完成的，并不会真正渲染到 DOM 中去。\n\n在 React 中创建虚拟虚拟元素可以分为两类：\n\n* DOM 元素\n* 组件元素\n\n分别对应：\n\n* 原生 DOM 元素\n* 自定义元素\n\n例如一个按钮\n\n```\n<button class=\"btn btn-blue\">\n	<em>Confirm<em>\n</button> \n```\n\n**DOM 元素**\n\n这些HTML元素可以被 JavaScript 转换为纯粹的 JSON 对象。我们可以通过 JSON 对象来描述 DOM 元素。\n\n```\n{\n	type: \'button\',\n	props: {\n		className: \'btn btn-blue\',\n		children: {\n			type: \'em\',\n			props: {\n				children: \'Confirm\'\n			}\n		}\n	}\n}\n```\n\n**组件对象**\n\n我们可以封装上述 button 元素，得到一个公共方法。\n\n```\nconst button = ({color, text}) => {\n    return {\n        type: \'button\',\n        props: {\n            className: \'btn btn-${color}\',\n            children: {\n                type: \'em\',\n                props: {\n                    children: text\n                }\n            }\n        }\n    }\n}\n```\n\n其实这个 button 方法也可以作为元素存在，方法名对应元素类型，参数对应 DOM 元素属性，它就具备了元素的两大必要条件，这样构建的元素就是自定义类型元素，或称组件元素。\n\n用 JSON 结构来描述它：\n\n```\n{\n	type: Button,\n	props: {\n		color: \'blue\',\n		children: \'confirm\'\n	}\n}\n```\n\n这样我们就可以一直嵌套封装组件元素，但是就是这样，代码会变得非常难以阅读。\n\n* JSX 将 HTML 语法直接加入 JavaScript 代码中，再通过翻译器转换到纯 JavaScript 后由浏览器执行。\n* 在实际开发中，JSX 在产品打包阶段都已经编译成纯 JavaScript。\n* 现在采用 Babel 的 JSX 编译器实现解析 JSX 语法（以前React为JSX解析开发了一套编译器 JSTransform）\n* Babel 作为专门的 JavaScript 语法编译工具，提供了更为强大的功能，达到了“一处配置，统一运行”的目的。\n\n\n使用 JSX 语法来描述组件元素\n\n```\nconst button = () => (\n	<button class=\"btn btn-blue\">\n		<em>Confirm<em>\n	</button> \n)\n```\n\n组件通过 Babel 转译成 React 可执行的代码：\n\n```\nvar button = button() {\n	return React.createElement(\n		\'button\',\n		{className: \'btn btn-blue\'},\n		React.createElement(\n			\'em\',\n			null,\n			\'Confirm\'\n		)\n	)\n}\n```\n\n#### JSX 基本语法\n\nJSX 的官方定义是类 XML 语法的 ECMAScripte 拓展。\n\n```\nconst List = () => {\n	<div>\n		<Title>This is Title</Title>\n		<ul>\n			<li>list item</li>\n			<li>list item</li>\n			<li>list item</li>\n		</ul>\n	</div>\n}\n```\n\n**XML 基本语法**\n\n* 定义标签时，只允许被一个标签包裹。\n* 标签一定要闭合。\n\n\n**元素类型**\n\n* 标签以小写字母开头对应 DOM 元素。比如 List 组件中的 `<div>` 标签会生成 DOM 元素。\n* 标签以大写字母开头对应组件元素。比如 List 组件中的 `<Title>` 会生成组件元素。\n* JSX 还可以通过命名空间的方式使用组件元素，以解决组件相同名称冲突的问题，或是对一组组件进行归类。\n\n```\nconst App = () => (\n	{/*节点注释*/}\n	<MUI.RaiseButton \n	/*\n		多行注释\n	*/\n	label=\"Default\" />\n);\n```\n\n**元素属性**\n\n元素除了标签之外，另一个组成部分就是标签的属性。\n\n不论是 DOM 元素还是组件元素，它们都有属性。不同的是：\n\n* DOM 元素的属性是标准规范属性，但有两个例外 class 和 for ，因为在 JavaScript 中这两个单词都是关键词\n	* class 属性改 className\n	* for 属性改为 htmlFor\n* 组件元素属性是完全自定义的属性，也可以理解为实现组件所需要的参数。\n\n*Boolean 属性*\n\n省略 Boolean 属性会导致 JSX 认为 bool 值设为 true。这常用于表单元素中，比如 disabled、required、checked 和 readOnly 等。\n\n```\n<Checkbox checked={true} /> \n//可以简写 \n<Checkbox checked />\n```\n\n*展开属性*\n\n例如\n\n```\nconst component = <Component name={name} value={value} />\n```\n\n不能这样设置属性。\n\n```\nconst component = <Componnet />;\ncomponent.props.name = name;\ncomponent.props.value = value;\n```\n\nReact 不能帮你检查属性类型（propTypes）。即使组件属性类型有错误，也不能得到清晰的错误提示。\n\n可以这样设置\n\n```\nconst data = {name: \'foo\', value: \'bar\'};\nconst component = <Componnet {...data}/>\n```\n\n*自定义HTML属性*\n\n如果在 JSX 中往DOM 元素中传入自定义属性，React 是不会渲染的：\n\n```\n<div x=\"xxx\" />\n```\n\n如果要使用HTML 自定义属性，要使用 `data-` 前缀，这与 HTML 标准一致：\n\n```\n<div data-x=\"xxx\" />\n```\n\n渲染出来的效果跟这个一致。\n\n在自定义标签中任意的属性都是被支持的：\n\n```\n<x-my-component custom-attr=\"foo\" />\n```\n\n以 `aria-` 开头的网络无障碍属性也同样可以正常使用：\n\n```\n<div aria-hidden=\"true\" />\n```\n\n**JavaScript 属性表达式**\n\n属性值要使用表达式，只要用 `{}` 替换 `\"\"` 即可\n\n*HTML转义*\n\nReact 会将所有要显示到 DOM 的字符串转义，防止 XSS。所以，如果 JSX 中含有转义后的实体字符，比如 `&copy` ，则到最后DOM不会正确显示，因为 React 自动把 `&copy` 中的特殊字符转义了。\n\n有几种解决方法\n\n* 直接使用UTF-8字符。\n* 使用字符对应的 Unicode编码查询编码。\n* 使用数组组装 `<div>{[\'cc\', \'<span>&copy<span>\', \'2019\']}</div>`\n* 直接插入原始的 HTML\n\n此外，React 提供了 dangerouslySetInnerHTML 属性。正如其名，它的作用就是避免 React 转义字符，所以需要在确定必要的时候使用它：\n\n```\n<div dangerouslySetInnerHTML={{__html: \'cc &copy; 2019\'}} />\n```\n\n### React 组件\n\n#### React 组件得构成\n\n![React组件的组成](The-composition-of-the-React-component.png)\n\n* React 组件基本由 属性（props）、状态（state）以及生命周期方法组成。\n* React 组件即为组件元素，组件元素被描述成纯粹的JSON 对象，意味着可以使用方法或类来构建。\n* 一旦接收到的参数或自身状态有所改变，React 组件就会执行相应的生命周期方法，最后渲染。\n\nReact 提供了3种不同的方法构建 React 组件：\n\n* React.createClass\n* ES6 classes\n* 无状态函数（stateless function）\n\n**React.createClass**\n\n* 最传统、也是兼容性最好的构建组件方法\n* 在 0.14 版本发布之前，官方指定的方法。但是现在测试已经不能使用了。\n\n```\nconst Button = React.createClass({\n	getDefaultProps() {\n		return {\n			color: \'blue\',\n			text: \'confirm\'\n		};\n	},\n	render() {\n		const { color, text } = this.props;\n		\n		return(\n			<button className={\'btn btn-${color}\'}>\n				<em>{text}</em>\n			</button>\n    )\n	}\n})\n```\n\n* 后面的版本需要这样使用\n* 引用 `npm install create-react-class`\n\n```\nimport createReactClass from \'create-react-class\';\n\nconst Button = createReactClass({\n  getDefaultProps() {\n		return {\n			color: \'blue\',\n			text: \'confirm\'\n		};\n	},\n	render() {\n		const { color, text } = this.props;\n		\n		return(\n			<button className={\'btn btn-${color}\'}>\n				<em>{text}</em>\n			</button>\n    	)\n	}\n})\n\nexport default Button;\n\n```\n\n当另一个组件需要调用 Button 组件时，只用写成 `<Button />`，就可以被解析成 `React.createElement(button)` 方法来创建 Button 实例。\n\n**ES6 classes**\n\nES6 classes 的写法是通过 ES6 标准的类语法的方式来构建：\n\n```\nimport React, { Component } from \'react\';\n\nclass Button extends Component {\n	constructor(props) {\n		super(props);\n	}\n	\n	static defaultProps = {\n		color: \'blue\',\n		text: \'Confirm\'\n	};\n	\n	render() {\n		const { color, text } = this.props;\n		\n		return(\n			<button className={\'btn btn-${color}\'}>\n				<em>{text}</em>\n			</button>\n    	)\n	}\n}\n```\n\n\n**无状态函数**\n\n```\nfunction Button({ color = \'blue\', text = \'Confirm\'}) {\n	return (\n		<button className={\'btn btn-${color}\'}>\n			<em>{text}</em>\n		</button>\n	)\n}\n```\n\n* 不存在 state，也没有声明周期函数。\n\n\n### 数据流\n\n在 React 中，数据是自顶向下单向流动的，即从父组件到子组件。\n\n* 顶层组件初始化 props，那么 React 会向下遍历整棵组件树，重新尝试渲染所有相关的子组件。\n* 而 state 只关心每个组件自己内部的状态，这些状态只能在组件内改变。\n* 把组件看出一个函数，那么它接收了 props 作为参数，内部由 state 作为函数内部参数，返回一个 Virtual DOM 的实现。\n\n#### state\n\n* State是一个组件的UI数据模型，是组件渲染时的数据依据。\n* 通过在构造函数（constructor）中初始化 state，这也是唯一一个可以可以直接使用 `this.state={xxx:xxx}`的方式修改state的情况。\n* 在其他时候我们需要通过 `setState` 这个异步方法进行修改，在一个生命周期内的所有 `setState` 方法会合并操作。\n\n#### props\n\n* props经常被用作渲染组件和初始化状态，当一个组件被实例化之后，它的props是只读的，不可改变的。如果props在渲染过程中可以被改变，会导致这个组件显示的形态变得不可预测。只有通过父组件重新渲染的方式才可以把新的props传入组件中。\n* 要渲染一个对props加工后的值，最简单的办法就是使用局部变量或直接在JSX中计算结果。\n\n\n**子组件 prop**\n\n* 在 React 中有一个重要且内置的 prop —— children，它代表组件的子组件集合。\n* React.Children 提供了处理 this.props.children 这个不透明数据结构的工具。\n* React.Children.map \n	* `React.Children.map(children, function[(thisArg)])`在包含在 children 里的每个直接孩子上调用一个函数，并且this 设置为 thisArg 。\n	* 如果 children 是一个数组它将被遍历，函数将被调用为每个数组中的孩子。如果 children 是 null 或 undefined ，这个方法将返回 null 或 undefined 而不是一个数组。\n* React.Children.only\n	* `React.Children.only(this.props.children)`\n	* 验证children只有唯一一个孩子（React元素）并返回它。否则这个方法扔抛出一个错误。这个错误会导致页面显示失败。\n* React.Children.count\n	* 返回 children 中的组件总数，等于传给 map 或 forEach 的回调函数被调用的次数。\n* React.Children.forEach\n * 类似 React.Children.map() ，但是不返回数组。\n \n\n需要注意的是这里children是写在使用这个组件的地方，组件标签内包含的组件，不是这个组件中 render 函数返回的里面包含的组件。如下面 `<Item>` 的子组件是 `<h1>11111</h1>`、`<p>2222</p>`和`something`，而不是它render函数内包含的组件。\n\n```\n<Item>\n  <h1>11111</h1>\n  <p>2222</p>\n  something\n</Item>\n```\n\n```\nimport React, { Component } from \'react\';\n\nclass Item extends Component {\n	constructor(props) {\n        super(props);\n	}\n    renderChild() {\n        const child = React.Children.map(this.props.children,(children)=>{\n              return (<div>{children.type ? children.type: children}</div>)\n          })\n        return child\n    }\n\n	render() {\n		return(\n			<div>\n                {this.renderChild()}\n			</div>\n    	)\n	}\n}\n\nexport default Item;\n\n// 显示\n/*\nh1\np\nsomething\n*/\n```\n\n\n\n**组件 props**\n\n可以将子组件作为props传入到另一个组件中\n\n```\n<Button item={<div>hello,world</div>}/>\n```\n\n```\nclass Button extends Component {\n	constructor(props) {\n		super(props);\n	}\n	render() {\n		\n		return(\n			<div className=\"item\">\n                {this.props.item}\n            </div>\n    	)\n	}\n}\nexport default Button;\n```\n\n**用function prop 与父组件通信**\n\n```\nclass App extends Component {\n	constructor(props) {\n		super(props);\n	}\n	handleClick() {\n		console.log(\'handleClick\')\n	}\n	render() {\n		\n		return(\n			<div>\n				<Button onClick={this.handleClick}></Button>\n			</div>\n    	)\n	}\n}\n```\n\n\n```\nclass Button extends Component {\n	constructor(props) {\n		super(props);\n		this.buttonClick = this.buttonClick.bind(this)\n	}\n	buttonClick() {\n		this.props.onClick()\n	}\n	render() {\n		\n		return(\n			<div>\n				<div onClick={this.buttonClick}>handleClick</div>\n				<div onClick={()=>{this.props.onClick()}}>handleClick</div>\n			</div>\n    	)\n	}\n}\nexport default Button;\n```\n\n**propTypes**\n\n* propTypes 用于规范 props 的类型与必需的状态。\n* 如果定义了 propTypes，那么在开发环境下，就会对组件的 props 值的类型做检查，如果传入的 props 不能与之匹配，React 将会实时在控制台里报 warning。\n* 生成环境不会检查。\n\n\n新版本需要安装 prop-types\n\n```\nimport PropTypes from \'prop-types\'\n\n// 这个写在写在class里面\n// static propTypes = {\n// 	onClick: PropTypes.func\n// }\n\n// 这个写在class外面，跟上面的效果一样\nButton.propTypes = {\n	onClick: PropTypes.func\n}\n```\n\n老版本\n\n```\nButton.propTypes = {\n	onClick: React.PropTypes.func\n}\n```\n\n### 生命周期\n\n* React 组件的生命周期可以分为挂载、渲染和卸载这几个阶段。\n\n#### 组件的挂载\n\n挂载过程会先后执行\n\n* componentWillMount\n* render\n* componentDidMount\n\n这些方法只会在初始化的时候执行一次。\n\n#### 组件卸载\n\n组件卸载之前会执行一个方法，通常用于执行一些清理方法，如事件回收或是清除定时器。\n\n* componentWillUnmount\n\n#### 组件更新\n\n更新过程指的是父组件向下传递 props 或组件自身执行 setState 方法时发生的一系列更新动作。\n\n当我们在shouldComponentUpdate方法返回false时，后面的方法都不会被执行，表示组件不需要更新。\n\n* shouldComponentUpdate\n* componentWillUpdate\n* render\n* componentDidUpdate\n\n需要注意的几个地方\n\n* 默认情况下，React会渲染\n\n\n\n\n\n\n\n\n\n','Next.js 是一个轻量级的 React 服务端渲染应用框架。有了它我们可以简单轻松的实现React的服务端渲染，从而加快首屏打开速度，也可以作SEO（收索引擎优化了）。在没有Next.js的时候，用React开发需要配置很多繁琐的参数，如Webpack配置，Router配置和服务器端配置等....。如果需要作SEO，要考虑的事情就更多了，怎么样服务端渲染和客户端渲染保持一致就是一件非常麻烦的事情，需要引入很多第三方库。但有了Next.js，这些问题都解决了，使开发人员可以将精力放在业务逻辑上，从繁琐的配置中解放出来。',1575388800,16883,1),(2,2,'React Router 免费文字视频教程（共9集）','## 初始 React 世界\n\n### React 简介\n\n* React 是一个 JavaScript 库，由 Facebook 在2013年开源。\n* React 把用户对象抽象成一个可复用组件。\n* 有了组件这层抽象，React把代码和真实渲染目标隔离开来。（因为这个所以可以开发网页和原生移动应用）\n\n#### 专注视图层\n\n* React 包含 View 和 Controller 的库。\n* 根据需要搭配 Flux 、Redux、GraphQL/Relay 来处理复杂的业务场景的应用。\n* 以 Minimal API Interface （最少API接口）为目标，只提供组件化相关的非常少量的接口。\n\n#### Virtual DOM\n\n**传统页面**\n\n![传统Dom更新](Traditional-DOM-Update.jpg)\n\n* 更新新页面时，都要手动操作 DOM 来进行更新。\n* DOM 操作性能消耗最大，而且这部分代码会让整体项目的代码变得难以维护\n\n**React**\n\n![传统Dom更新](React-Dom-Update.jpg)\n\n* React 把真实的 DOM 树转换成 JavaScript 对象树，也就是 Virtual DOM。\n* 每次数据更新后，重新计算 Virtual DOM，并和上一次生成的 Virtual DOM 做对比，对发生变化的部分做批量更新。\n* React 也提供直观的 ```shouldComponentUpdate``` 生命周期函数回调，减少数据变化后不必要的 Virtual DOM 对比国产，以保证性能。\n* Virtual DOM 的渲染方式也比传统 DOM 操作好一些，但并不明显，因为对比 DOM 节点也是需要计算资源的。\n* 最大的好处是方便与其他平台集成。React 可以根据对应平台输出对应的组件。（Web DOM，Android控件，iOS控件）\n\n#### 函数式编程\n\n* React 能充分利用很多函数方式去减少冗余的代码。\n* 由于它本身就是简单函数，所以易于测，所以便于测试。\n\n### JSX 语法\n\n#### JSX 的由来\n\nReact 是通过创建和更新虚拟元素来管理整个 Virtual DOM 的，但是虚拟元素仅仅通过 JavaScript 来描述会变得异常复杂，所以才有 JSX。\n\n虚拟元素可以理解为真实元素的对应，它的构建与更新都是在内存中完成的，并不会真正渲染到 DOM 中去。\n\n在 React 中创建虚拟虚拟元素可以分为两类：\n\n* DOM 元素\n* 组件元素\n\n分别对应：\n\n* 原生 DOM 元素\n* 自定义元素\n\n例如一个按钮\n\n```\n<button class=\"btn btn-blue\">\n	<em>Confirm<em>\n</button> \n```\n\n**DOM 元素**\n\n这些HTML元素可以被 JavaScript 转换为纯粹的 JSON 对象。我们可以通过 JSON 对象来描述 DOM 元素。\n\n```\n{\n	type: \'button\',\n	props: {\n		className: \'btn btn-blue\',\n		children: {\n			type: \'em\',\n			props: {\n				children: \'Confirm\'\n			}\n		}\n	}\n}\n```\n\n**组件对象**\n\n我们可以封装上述 button 元素，得到一个公共方法。\n\n```\nconst button = ({color, text}) => {\n    return {\n        type: \'button\',\n        props: {\n            className: \'btn btn-${color}\',\n            children: {\n                type: \'em\',\n                props: {\n                    children: text\n                }\n            }\n        }\n    }\n}\n```\n\n其实这个 button 方法也可以作为元素存在，方法名对应元素类型，参数对应 DOM 元素属性，它就具备了元素的两大必要条件，这样构建的元素就是自定义类型元素，或称组件元素。\n\n用 JSON 结构来描述它：\n\n```\n{\n	type: Button,\n	props: {\n		color: \'blue\',\n		children: \'confirm\'\n	}\n}\n```\n\n这样我们就可以一直嵌套封装组件元素，但是就是这样，代码会变得非常难以阅读。\n\n* JSX 将 HTML 语法直接加入 JavaScript 代码中，再通过翻译器转换到纯 JavaScript 后由浏览器执行。\n* 在实际开发中，JSX 在产品打包阶段都已经编译成纯 JavaScript。\n* 现在采用 Babel 的 JSX 编译器实现解析 JSX 语法（以前React为JSX解析开发了一套编译器 JSTransform）\n* Babel 作为专门的 JavaScript 语法编译工具，提供了更为强大的功能，达到了“一处配置，统一运行”的目的。\n\n\n使用 JSX 语法来描述组件元素\n\n```\nconst button = () => (\n	<button class=\"btn btn-blue\">\n		<em>Confirm<em>\n	</button> \n)\n```\n\n组件通过 Babel 转译成 React 可执行的代码：\n\n```\nvar button = button() {\n	return React.createElement(\n		\'button\',\n		{className: \'btn btn-blue\'},\n		React.createElement(\n			\'em\',\n			null,\n			\'Confirm\'\n		)\n	)\n}\n```\n\n#### JSX 基本语法\n\nJSX 的官方定义是类 XML 语法的 ECMAScripte 拓展。\n\n```\nconst List = () => {\n	<div>\n		<Title>This is Title</Title>\n		<ul>\n			<li>list item</li>\n			<li>list item</li>\n			<li>list item</li>\n		</ul>\n	</div>\n}\n```\n\n**XML 基本语法**\n\n* 定义标签时，只允许被一个标签包裹。\n* 标签一定要闭合。\n\n\n**元素类型**\n\n* 标签以小写字母开头对应 DOM 元素。比如 List 组件中的 `<div>` 标签会生成 DOM 元素。\n* 标签以大写字母开头对应组件元素。比如 List 组件中的 `<Title>` 会生成组件元素。\n* JSX 还可以通过命名空间的方式使用组件元素，以解决组件相同名称冲突的问题，或是对一组组件进行归类。\n\n```\nconst App = () => (\n	{/*节点注释*/}\n	<MUI.RaiseButton \n	/*\n		多行注释\n	*/\n	label=\"Default\" />\n);\n```\n\n**元素属性**\n\n元素除了标签之外，另一个组成部分就是标签的属性。\n\n不论是 DOM 元素还是组件元素，它们都有属性。不同的是：\n\n* DOM 元素的属性是标准规范属性，但有两个例外 class 和 for ，因为在 JavaScript 中这两个单词都是关键词\n	* class 属性改 className\n	* for 属性改为 htmlFor\n* 组件元素属性是完全自定义的属性，也可以理解为实现组件所需要的参数。\n\n*Boolean 属性*\n\n省略 Boolean 属性会导致 JSX 认为 bool 值设为 true。这常用于表单元素中，比如 disabled、required、checked 和 readOnly 等。\n\n```\n<Checkbox checked={true} /> \n//可以简写 \n<Checkbox checked />\n```\n\n*展开属性*\n\n例如\n\n```\nconst component = <Component name={name} value={value} />\n```\n\n不能这样设置属性。\n\n```\nconst component = <Componnet />;\ncomponent.props.name = name;\ncomponent.props.value = value;\n```\n\nReact 不能帮你检查属性类型（propTypes）。即使组件属性类型有错误，也不能得到清晰的错误提示。\n\n可以这样设置\n\n```\nconst data = {name: \'foo\', value: \'bar\'};\nconst component = <Componnet {...data}/>\n```\n\n*自定义HTML属性*\n\n如果在 JSX 中往DOM 元素中传入自定义属性，React 是不会渲染的：\n\n```\n<div x=\"xxx\" />\n```\n\n如果要使用HTML 自定义属性，要使用 `data-` 前缀，这与 HTML 标准一致：\n\n```\n<div data-x=\"xxx\" />\n```\n\n渲染出来的效果跟这个一致。\n\n在自定义标签中任意的属性都是被支持的：\n\n```\n<x-my-component custom-attr=\"foo\" />\n```\n\n以 `aria-` 开头的网络无障碍属性也同样可以正常使用：\n\n```\n<div aria-hidden=\"true\" />\n```\n\n**JavaScript 属性表达式**\n\n属性值要使用表达式，只要用 `{}` 替换 `\"\"` 即可\n\n*HTML转义*\n\nReact 会将所有要显示到 DOM 的字符串转义，防止 XSS。所以，如果 JSX 中含有转义后的实体字符，比如 `&copy` ，则到最后DOM不会正确显示，因为 React 自动把 `&copy` 中的特殊字符转义了。\n\n有几种解决方法\n\n* 直接使用UTF-8字符。\n* 使用字符对应的 Unicode编码查询编码。\n* 使用数组组装 `<div>{[\'cc\', \'<span>&copy<span>\', \'2019\']}</div>`\n* 直接插入原始的 HTML\n\n此外，React 提供了 dangerouslySetInnerHTML 属性。正如其名，它的作用就是避免 React 转义字符，所以需要在确定必要的时候使用它：\n\n```\n<div dangerouslySetInnerHTML={{__html: \'cc &copy; 2019\'}} />\n```\n\n### React 组件\n\n#### React 组件得构成\n\n![React组件的组成](The-composition-of-the-React-component.png)\n\n* React 组件基本由 属性（props）、状态（state）以及生命周期方法组成。\n* React 组件即为组件元素，组件元素被描述成纯粹的JSON 对象，意味着可以使用方法或类来构建。\n* 一旦接收到的参数或自身状态有所改变，React 组件就会执行相应的生命周期方法，最后渲染。\n\nReact 提供了3种不同的方法构建 React 组件：\n\n* React.createClass\n* ES6 classes\n* 无状态函数（stateless function）\n\n**React.createClass**\n\n* 最传统、也是兼容性最好的构建组件方法\n* 在 0.14 版本发布之前，官方指定的方法。但是现在测试已经不能使用了。\n\n```\nconst Button = React.createClass({\n	getDefaultProps() {\n		return {\n			color: \'blue\',\n			text: \'confirm\'\n		};\n	},\n	render() {\n		const { color, text } = this.props;\n		\n		return(\n			<button className={\'btn btn-${color}\'}>\n				<em>{text}</em>\n			</button>\n    )\n	}\n})\n```\n\n* 后面的版本需要这样使用\n* 引用 `npm install create-react-class`\n\n```\nimport createReactClass from \'create-react-class\';\n\nconst Button = createReactClass({\n  getDefaultProps() {\n		return {\n			color: \'blue\',\n			text: \'confirm\'\n		};\n	},\n	render() {\n		const { color, text } = this.props;\n		\n		return(\n			<button className={\'btn btn-${color}\'}>\n				<em>{text}</em>\n			</button>\n    	)\n	}\n})\n\nexport default Button;\n\n```\n\n当另一个组件需要调用 Button 组件时，只用写成 `<Button />`，就可以被解析成 `React.createElement(button)` 方法来创建 Button 实例。\n\n**ES6 classes**\n\nES6 classes 的写法是通过 ES6 标准的类语法的方式来构建：\n\n```\nimport React, { Component } from \'react\';\n\nclass Button extends Component {\n	constructor(props) {\n		super(props);\n	}\n	\n	static defaultProps = {\n		color: \'blue\',\n		text: \'Confirm\'\n	};\n	\n	render() {\n		const { color, text } = this.props;\n		\n		return(\n			<button className={\'btn btn-${color}\'}>\n				<em>{text}</em>\n			</button>\n    	)\n	}\n}\n```\n\n\n**无状态函数**\n\n```\nfunction Button({ color = \'blue\', text = \'Confirm\'}) {\n	return (\n		<button className={\'btn btn-${color}\'}>\n			<em>{text}</em>\n		</button>\n	)\n}\n```\n\n* 不存在 state，也没有声明周期函数。\n\n\n### 数据流\n\n在 React 中，数据是自顶向下单向流动的，即从父组件到子组件。\n\n* 顶层组件初始化 props，那么 React 会向下遍历整棵组件树，重新尝试渲染所有相关的子组件。\n* 而 state 只关心每个组件自己内部的状态，这些状态只能在组件内改变。\n* 把组件看出一个函数，那么它接收了 props 作为参数，内部由 state 作为函数内部参数，返回一个 Virtual DOM 的实现。\n\n#### state\n\n* State是一个组件的UI数据模型，是组件渲染时的数据依据。\n* 通过在构造函数（constructor）中初始化 state，这也是唯一一个可以可以直接使用 `this.state={xxx:xxx}`的方式修改state的情况。\n* 在其他时候我们需要通过 `setState` 这个异步方法进行修改，在一个生命周期内的所有 `setState` 方法会合并操作。\n\n#### props\n\n* props经常被用作渲染组件和初始化状态，当一个组件被实例化之后，它的props是只读的，不可改变的。如果props在渲染过程中可以被改变，会导致这个组件显示的形态变得不可预测。只有通过父组件重新渲染的方式才可以把新的props传入组件中。\n* 要渲染一个对props加工后的值，最简单的办法就是使用局部变量或直接在JSX中计算结果。\n\n\n**子组件 prop**\n\n* 在 React 中有一个重要且内置的 prop —— children，它代表组件的子组件集合。\n* React.Children 提供了处理 this.props.children 这个不透明数据结构的工具。\n* React.Children.map \n	* `React.Children.map(children, function[(thisArg)])`在包含在 children 里的每个直接孩子上调用一个函数，并且this 设置为 thisArg 。\n	* 如果 children 是一个数组它将被遍历，函数将被调用为每个数组中的孩子。如果 children 是 null 或 undefined ，这个方法将返回 null 或 undefined 而不是一个数组。\n* React.Children.only\n	* `React.Children.only(this.props.children)`\n	* 验证children只有唯一一个孩子（React元素）并返回它。否则这个方法扔抛出一个错误。这个错误会导致页面显示失败。\n* React.Children.count\n	* 返回 children 中的组件总数，等于传给 map 或 forEach 的回调函数被调用的次数。\n* React.Children.forEach\n * 类似 React.Children.map() ，但是不返回数组。\n \n\n需要注意的是这里children是写在使用这个组件的地方，组件标签内包含的组件，不是这个组件中 render 函数返回的里面包含的组件。如下面 `<Item>` 的子组件是 `<h1>11111</h1>`、`<p>2222</p>`和`something`，而不是它render函数内包含的组件。\n\n```\n<Item>\n  <h1>11111</h1>\n  <p>2222</p>\n  something\n</Item>\n```\n\n```\nimport React, { Component } from \'react\';\n\nclass Item extends Component {\n	constructor(props) {\n        super(props);\n	}\n    renderChild() {\n        const child = React.Children.map(this.props.children,(children)=>{\n              return (<div>{children.type ? children.type: children}</div>)\n          })\n        return child\n    }\n\n	render() {\n		return(\n			<div>\n                {this.renderChild()}\n			</div>\n    	)\n	}\n}\n\nexport default Item;\n\n// 显示\n/*\nh1\np\nsomething\n*/\n```\n\n\n\n**组件 props**\n\n可以将子组件作为props传入到另一个组件中\n\n```\n<Button item={<div>hello,world</div>}/>\n```\n\n```\nclass Button extends Component {\n	constructor(props) {\n		super(props);\n	}\n	render() {\n		\n		return(\n			<div className=\"item\">\n                {this.props.item}\n            </div>\n    	)\n	}\n}\nexport default Button;\n```\n\n**用function prop 与父组件通信**\n\n```\nclass App extends Component {\n	constructor(props) {\n		super(props);\n	}\n	handleClick() {\n		console.log(\'handleClick\')\n	}\n	render() {\n		\n		return(\n			<div>\n				<Button onClick={this.handleClick}></Button>\n			</div>\n    	)\n	}\n}\n```\n\n\n```\nclass Button extends Component {\n	constructor(props) {\n		super(props);\n		this.buttonClick = this.buttonClick.bind(this)\n	}\n	buttonClick() {\n		this.props.onClick()\n	}\n	render() {\n		\n		return(\n			<div>\n				<div onClick={this.buttonClick}>handleClick</div>\n				<div onClick={()=>{this.props.onClick()}}>handleClick</div>\n			</div>\n    	)\n	}\n}\nexport default Button;\n```\n\n**propTypes**\n\n* propTypes 用于规范 props 的类型与必需的状态。\n* 如果定义了 propTypes，那么在开发环境下，就会对组件的 props 值的类型做检查，如果传入的 props 不能与之匹配，React 将会实时在控制台里报 warning。\n* 生成环境不会检查。\n\n\n新版本需要安装 prop-types\n\n```\nimport PropTypes from \'prop-types\'\n\n// 这个写在写在class里面\n// static propTypes = {\n// 	onClick: PropTypes.func\n// }\n\n// 这个写在class外面，跟上面的效果一样\nButton.propTypes = {\n	onClick: PropTypes.func\n}\n```\n\n老版本\n\n```\nButton.propTypes = {\n	onClick: React.PropTypes.func\n}\n```\n\n### 生命周期\n\n* React 组件的生命周期可以分为挂载、渲染和卸载这几个阶段。\n\n#### 组件的挂载\n\n挂载过程会先后执行\n\n* componentWillMount\n* render\n* componentDidMount\n\n这些方法只会在初始化的时候执行一次。\n\n#### 组件卸载\n\n组件卸载之前会执行一个方法，通常用于执行一些清理方法，如事件回收或是清除定时器。\n\n* componentWillUnmount\n\n#### 组件更新\n\n更新过程指的是父组件向下传递 props 或组件自身执行 setState 方法时发生的一系列更新动作。\n\n当我们在shouldComponentUpdate方法返回false时，后面的方法都不会被执行，表示组件不需要更新。\n\n* shouldComponentUpdate\n* componentWillUpdate\n* render\n* componentDidUpdate\n\n需要注意的几个地方\n\n* 默认情况下，React会渲染\n\n\n\n\n\n\n\n\n\n','React Router 是一个基于React之上的强大路由库，它可以让你向应用中快速地添加视图和数据流，同时保持页面与URL间的同步。这是官方的解释，虽然足以解释React Router，但我觉的还不够重视这个插件。就目前我的工作经验所知，凡是React技术栈的项目（WEB和Native），都需要用到React Router。有了它你才可以构建复杂的应用程序，有了它才能使应用有层次感。如果没有React Router，我们智能用switch...case这样的语句，进行判断渲染，这非常的麻烦，而且不可用；但是有了React Router一切就变的简单了。\n\n学习这个文章之前，我默认你已经学习了前置的两篇文章，所以很多基础的内容我不会讲解。',1575388800,3333,1),(3,2,'1','2','3',1578240000,1002,1),(4,1,'12','2','3',1578240000,1065,1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型编号 int类型',
  `typeName` varchar(255) NOT NULL COMMENT '文章类型名称 varchar类型',
  `orderNum` int(11) NOT NULL COMMENT '类型排序编号 int类型',
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'视频教程',1,'youtube'),(2,'大胖逼逼唠',2,'message'),(3,'快乐生活',3,'smile');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-07 16:09:47
