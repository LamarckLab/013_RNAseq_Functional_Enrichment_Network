#### 加载所需包 ####
library(aPEAR)
library(ggplot2)
library(cols4all)

#### 设置工作目录并读取富集结果 ####
setwd("C:/Users/Lamarck/Desktop/")
result <- read.csv("UP_ego_result_BP.csv", header = TRUE)

#### 绘制富集网络图（不清洗数据）####
set.seed(123)  # 固定节点布局
p <- enrichmentNetwork(result,
                       colorBy = "pvalue",       # 显著性作为颜色映射
                       colorType = "pval",       # 自动转换为 -log10(pvalue)
                       nodeSize = "Count",       # 通路中基因数量作为节点大小
                       fontSize = 2,             # 节点标签字体大小
                       pCutoff = -10,            # 控制颜色渐变下限
                       drawEllipses = TRUE,      # 是否绘制聚类边界
                       verbose = TRUE) +
  guides(size = guide_legend(order = 1)) +                     # 图例顺序
  labs(color = "-log10(p-value)") +                            # 图例标题
  theme(legend.key = element_blank()) +                        # 去除图例背景框
  scale_color_continuous_c4a_seq("yl_gn_bu")                   # 使用好看的连续配色

#### 保存网络图为 PDF ####
ggsave(filename = "03_Net_GO_UP_from_csv.pdf",
       plot = p,
       width = 8, height = 8, dpi = 300)

print("图像保存为：03_Net_GO_UP_from_csv.pdf")
