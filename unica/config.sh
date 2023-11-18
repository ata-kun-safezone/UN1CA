#
# Copyright (C) 2023 BlackMesa123
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Source ROM firmware
case "$TARGET_SINGLE_SYSTEM_IMAGE" in
    # Qualcomm
    "qssi")
        # Galaxy S23 (One UI 6.0)
        SOURCE_FIRMWARE="SM-S911B/BTE"
        SOURCE_API_LEVEL=34
        SOURCE_VNDK_VERSION=33
        SOURCE_HAS_SYSTEM_EXT=true
        ;;
    "essi")
        # Galaxy S23 FE (One UI 5.1)
        SOURCE_FIRMWARE="SM-S711B/SEK"
        SOURCE_API_LEVEL=33
        SOURCE_HAS_SYSTEM_EXT=true
        ;;
    *)
        echo "\"$TARGET_SINGLE_SYSTEM_IMAGE\" is not a valid system image."
        return 1
        ;;
esac

return 0
