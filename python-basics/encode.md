# 编码问题

## 默认编码
python3 默认utf-8 仅适用于转字符串, 文件open()根据系统确定默认的编码格式    

```
s1 = b'test'
s2 = s1.decode('utf-8')
type(s1) 
>> <class 'bytes'> <class 'str'>
```

## html解析编码依据
```
<head>
    <meta charset="UTF-8">
</head>
```

## 编码判断
```
import chardet
body = b'...xxtestxx...'
encode_info = chardet.detect(body)  # body是bytes类型
encode_str = encode_info.get('encoding')
print(encode_info, encode_str)
    >> {'encoding': 'ascii', 'confidence': 1.0, 'language': ''}
item['body'] = body.decode(encode_str)  # 正确解码为str
```

## 判断文件的编码
```
import chardet
 
# 获取文件编码类型
def get_encoding(file):
    # 二进制方式读取，获取字节数据，检测类型
    with open(file, 'rb') as f:
        # 对于大文件,最好使用readline
        return chardet.detect(f.readline())['encoding']
```