;;; kaomoji-data.el --- data for kaomoji.el          -*- lexical-binding: t; -*-

;; Copyright (C) 2016  kuanyui

;; Author: kuanyui <azazabc123@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(setq kaomoji-table
      '((("angry" "table" "生氣" "翻桌")                         . "(╯°□°）╯︵ ┻━┻" )
        (("真是個壞女孩" )                                       . "∩ __∩ y" )
        (("cry" "泣き")                                          . "・ﾟ・｡･ﾟ･(つД｀)" )
        (("cry" "泣き" "哭哭")                                   . "(´;ω;`)" )
        (("cry" "泣き" "哭哭")                                   . "(´；д；｀)" )
        (("cry miserably" )                                      . "(;´༎ຶД༎ຶ`)" )
        (("dandin" "淡定" "淡定紅茶")                            . "ˊ_>ˋ" )
        (("heart" "ハート" "愛心")                               . "♥" )
        (("homo" "ホモ")                                         . "┌（┌ ＾o＾）┐ﾎﾓｫ" )
        (("kita" "来たー" "キター" "きたー")                     . "ｷﾀ――(ﾟ∀ﾟ)――!!" )
        (("lazy" "懶")                                           . "_(:3 」∠ )_ " )
        (("owo" )                                                . "ˊ・ω・ˋ" )
        (("relax" )                                              . "ˊvˋ" )
        (("uwu" )                                                . "( ˘ω˘ )" )
        (("sad")                                                 . "(´･_･`)")
        (("不知所云")                                            . "(ﾟ⊿ﾟ)")
        (("WTF" "什麼啦")                                        . "(｡ŏ_ŏ)")
        (("owo")                                                 . "( ˘•ω•˘ )")
        (("relax")                                               . "(´-ω-｀) ")
        (("爽翻")                                                . "(｡A｡) ")
        (("yeah" ">w<")                                                 . "(ﾉ>ω<)ﾉ ")
        (("rock")                                                 . "\m/ >_< \m/")
        (("cheers" "歡呼")                                       . "｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡ ")
        (("cheers" "歡呼")                                       . " ヾ(*´∀ ˋ*)ﾉ ")
        (("owo")                                                 . "(´・ω・`)")
        (("爽爽")                                                . "(ﾟ∀。)")
        (("非禮勿視")                                            . "(つд⊂) ")
        (("無奈" "面對國民黨支持者的表情" "面對中國五毛的表情")  . "╮(╯_╰)╭ ")
        (("haha" "你看看你" "UCCU" "uccu")                       . "σ ﾟ∀ ﾟ) ﾟ∀ﾟ)σ")
        (("me" "我嗎?")                                          . "σ(´∀｀*)")
        (("don't mind")                                          . "il||li _|￣|○ヽ(･ω･｀) ")
        (("摳屁股")                                              . "_(:3 ⌒ﾞ)_ ")
        (("five cent hello" "五毛你好")                          . "(・∀・)つ➄ ")
        (("yeah" "耶")                                           . "ε≡ﾍ( ´∀`)ﾉ ")
        (("我要生氣了" "i would be angry")                       . "(・`ω´・)")
        (("really?" "orly" "呵呵" "是嗎" "是喔")                 . "(≖ᴗ≖๑)")
        (("shocked" "震驚" "驚訝")                               . "(ﾟдﾟ)")
        (("so pity" "你好可憐喔")                                . "。･ﾟ･(つд`ﾟ)つ⑩))Д´)")
        ))
(setq punctuation-table
      '((("c degree" )                . "℃" )
        (("book" )                    . "《》" )
        (("paragraph" ) "【】" )
        (("pz" ) "－" )
        (("up" ) "↑" )
        (("down" )                    . "↓" )
        (("left" )                    . "←" )
        (("right" ) "→" )
        ))

(provide 'kaomoji-data)
;;; kaomoji-data.el ends here
