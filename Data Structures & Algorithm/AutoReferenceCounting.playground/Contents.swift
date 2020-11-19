import UIKit
///内存管理和异常处理
/**
 引用计数Automatic Reference Counting的引出
 */
//创建一个函数
func Test() {
    //变量a的作用域是整个函数内
    var a = 10
    while a > 0 {
        a -= 1
        //变量b的作用域是while循环块内，出了while循环块后变量b被销毁，占用的空间被释放
        var b = 2
    }
    if a<0 {
        //变量c的作用域是if语句块内，if语句结束后，变量c被销毁，占用空间被释放
        var c = 3
    }
}

//创建一个类
class TestClass {
    //name属性与当前类的实例相关联，生命周期与当前类的实例一直
    var name:String = "name"
    deinit {
        print("内存被销毁")
    }
}

//创建TestClass类的时候，其中属性name会被构造，并分配空间
var obj: TestClass? = TestClass()
//obj实例被销毁，属性也会被销毁，释放所有内存空间
obj = nil

//测试引用计数
var cls1: TestClass? = TestClass()
//进行引用类型的值的传递
var cls2 = cls1
var cls3 = cls2
//cls2对实例的引用取消，由于cls1和cls3的引用还存在，实例所占的内存依然安全
cls2 = nil
//cls1对实例的引用取消，由于cls3的引用还在，实例的内存依然安全
cls1 = nil
//cls3对实例的引用取消，没有变量进行引用实例，实例调用deinit方法，释放内存
cls3 = nil

/**
 循环引用的发生和解决
 */
//未发生循环引用
class ClassOne {
    deinit {
        print("ClassOne deinit")
    }
}
class ClassTwo {
    //ClassTwo中有一个ClassOne的属性
    var cls: ClassOne?
    init(cls: ClassOne?) {
        self.cls = cls
    }
    deinit {
        print("ClassTwo deinit")
    }
}
var class1: ClassOne? = ClassOne()
var class2:ClassTwo? = ClassTwo(cls: class1)
//此时ClassTwo类中的cls属性仍然在引用class1实例，因此class1实例所占的内存没有释放
class1 = nil
//此时class2被释放，class2中的属性也被释放，没有任何引用class1的情况，class1也被释放
class2 = nil
//循环引用
class ClassThree {
    var cls:ClassFour?
    deinit {
        print("ClassThree deinit")
    }
}
class ClassFour {
    var cls: ClassThree?
    init(cls: ClassThree?) {
        self.cls = cls
    }
    deinit {
        print("ClassFour deinit")
    }
}

var obj3: ClassThree? = ClassThree()
var obj4: ClassFour? = ClassFour(cls: obj3)
obj3?.cls = obj4
obj4 = nil
obj3 = nil

//使用weak弱引用解决循环引用问题
class ClassFive {
    //进行弱引用
    weak var cls:ClassSix?
    deinit {
        print("ClassFive deinit")
    }
}
class ClassSix {
    var cls: ClassFive?
    init(cls: ClassFive?) {
        self.cls = cls
    }
    deinit {
        print("ClassSix deinit")
    }
}

var obj5: ClassFive? = ClassFive()
var obj6: ClassSix? = ClassSix(cls: obj5)
obj5?.cls = obj6
obj6 = nil
print(obj5?.cls)
