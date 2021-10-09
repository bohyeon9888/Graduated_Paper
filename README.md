# Graduation Thesis
## 실험방법
### 실험 1)
Workload 실행 후 grep ANON 등으로 page 할당 상태 관찰
workload의 예) XSBench -t 4 -g 60000

### Linux THP의 defrag option
 direct compactiond을 조절하는 옵션으로 huge page 할당동안 synchronous memory compaction을 수행한다. 
 이를 비활성화하면 메모리 절약에는 비효율적일 수 있으나 page fault 시 발생하는latency를 줄일 수 있다.
