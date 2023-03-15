import logging as logger
import requests
import re
import random
import json


def _get_links(base_url):
    news_url_json = requests.get(base_url).content.decode(
        "utf8")
    news_url = json.loads(news_url_json)["DataSet"]
    json_urls = []
    for i in news_url:
        json_urls.append("https://www.xuexi.cn/lgdata/" + i.split('!')[1])
    all_news_object = []
    for url in json_urls:
        choose_json_str = requests.get(url).content.decode("utf8")
        all_news_object.extend(json.loads(choose_json_str))
    new_list = sorted(all_news_object, key=lambda x: x.get("publishTime", "0"), reverse=False)
    return [news["url"] for news in new_list]


def get_article_links():
    try:
        return _get_links("https://www.xuexi.cn/lgdata/896bddc5f57a423b857a85eb40f98945/72742e3e40c96ade71e42b6e7ed42419.json")
        # 下面获取文章的地址中文章没有继续更新，导致后面无法完成文章学习
        # article = requests.get(
        #     "https://www.xuexi.cn/c06bf4acc7eef6ef0a560328938b5771/data9a3668c13f6e303932b5e0e100fc248b.js").content.decode(
        #     "utf8")
        # pattern = r"list\"\:(.+),\"count\"\:"
        # links = []
        # list = eval(re.search(pattern, article).group(1))[:20000]
        # list.reverse()
        # for i in range(len(list)):
        #     links.append(list[i]["static_page_url"])
        # return links
    except:
        logger.info("=" * 60)
        logger.info("get_article_links获取失败")
        logger.info("=" * 60)
        raise


def get_video_links():
    try:
        return _get_links("https://www.xuexi.cn/lgdata/4426aa87b0b64ac671c96379a3a8bd26/db086044562a57b441c24f2af1c8e101.json")

        # 下面的方法只获取了20个地址返回，且是随机获取的，返回的地址可能有之前用过的，不能保证学习满积分
        # video_json = requests.get("https://www.xuexi.cn/lgdata/4426aa87b0b64ac671c96379a3a8bd26/db086044562a57b441c24f2af1c8e101.json").content.decode("utf8")
        # video=json.loads(video_json)["DataSet"]
        # json_urls = []
        # link = []
        # for i in video:
        #     json_urls.append("https://www.xuexi.cn/lgdata/"+i.split('!')[1])
        # while len(link) < 20:
        #     choose_json_url = random.choice(json_urls)
        #     choose_json_str = requests.get(choose_json_url).content.decode("utf8")
        #     pattern = r'https://www.xuexi.cn/[^,"]*'
        #     choose_links = re.findall(pattern, choose_json_str, re.I)
        #     if(len(choose_links) >= 5):
        #         choose_sample = random.sample(choose_links, 5)
        #         for c in choose_sample:
        #             link.append(c)
        # random.shuffle(link)
        # return link
    except:
        logger.info("=" * 60)
        logger.info("get_video_links获取失败")
        logger.info("=" * 60)
        raise
